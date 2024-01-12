extends Node3D

var target_x_rot = 0

@onready var initial_pos = position
@onready var target_y_pos = position.y


# Called when the node enters the scene tree for the first time.
func _ready():
	print(name)
	GlobalSignals.connect("revealPressed", _on_reveal_pressed)
	GlobalSignals.connect("loadSet", _on_load_set)
	
func _on_reveal_pressed(number):
	if("AnswerPanel" + str(number) == name):
		print(name + " has received signal")
		target_x_rot = deg_to_rad(150)
		target_y_pos = initial_pos.y+0.009
		var points = int(get_node("Points").text)
		GlobalSignals.emit_signal("addPoints", points)
	if(number == 0):
		target_x_rot = deg_to_rad(0)
		target_y_pos = initial_pos.y
		


func _on_load_set(number):
	var sets = [

[
["Tidur saat pelajaran","36"],
["Tidak menyimpan HP di loker","32"],
["Kuku Panjang","26"],
["Terlambat Mengumpulkan Tugas","23"],
["Mengucapkan kata-kata kasar","18"],
["Tidak menggunakan kaos kaki pramuka","15"],
["Rambut Panjang","11"],
["Nyontek","8"],
],

[
["Handphone ","35"],
["Buku Pelajaran","32"],
["Alat Tulis","30"],
["Botol Minum","25"],
["Dompet","22"],
["Ipad","10"],
["Baju ganti","12"],
["Alat makan","8"],
],

[
["Ruang guru","35"],
["Lab Komputer","30"],
["Perpustakaan","28"],
["Lab Kimia","25"],
["Lab Fisika","23"],
["Lab Biologi","20"],
["Ruang BK","11"],
["Kantin","2"],
],

[
["Libur Akhir Semester/Akhir Tahun","34"],
["Weekend","27"],
["Tanggal Merah","24"],
["Jam Pulang","19"],
["Jam Istirahat","16"],
["CC / Bina Iman / Karya Wisata","13"],
["Minggu Smak\nOne Cup","7"],
["Hari Jumat","4"],
],

[
["Hellweek non-stop","35"],
["Presentasi depan Bu KM","30"],
["Dipanggil wakasis","25"],
["Kirain bakal klasikal ternyata engga","24"],
["Ketauan nyontek on the spot","18"],
["Stuck di lift barang sendirian","15"],
["Remedial","9"],
["Ga keterima\norganisasi","5"],
],

]
	get_node("Points").text = sets[number-1][int(name.right(1))-1][1]
	get_node("Question").text = sets[number-1][int(name.right(1))-1][0]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotation = lerp(rotation, Vector3(target_x_rot, 0, 0), 10*delta)
	position = lerp(position, Vector3(initial_pos.x, target_y_pos, initial_pos.z), 10*delta)
