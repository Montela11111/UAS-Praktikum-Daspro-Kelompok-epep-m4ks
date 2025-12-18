program ToDoList;
uses crt;

type
  { Record untuk menyimpan data tugas }
  TTugas = record
    nama   : string;   
    status : string;   
  end;

var
  tugas : array[1..50] of TTugas; { Array untuk menyimpan daftar tugas }
  n     : integer;
  pil   : integer;

{ Prosedur untuk menambahkan tugas baru }
procedure Tambah;
begin
  clrscr;
  inc(n);
  write('Masukkan nama tugas : ');
  readln(tugas[n].nama);
  tugas[n].status := 'Belum';
  writeln('Tugas berhasil ditambahkan');
  readln;
end;

{ Prosedur untuk menampilkan seluruh tugas }
procedure Tampil;
var i: integer;
begin
  clrscr;
  writeln('===== DAFTAR TUGAS =====');
  for i := 1 to n do
    writeln(i,'. ',tugas[i].nama,' | Status: ',tugas[i].status);
  readln;
end;

{ Prosedur untuk mengubah status tugas }
procedure Ubah;
var p: integer;
begin
  clrscr;
  write('Masukkan nomor tugas: ');
  readln(p);
  if tugas[p].status='Belum' then
    tugas[p].status:='Selesai'
  else
    tugas[p].status:='Belum';
  writeln('Status tugas diperbarui');
  readln;
end;

{ Prosedur untuk menghitung jumlah tugas selesai dan belum }
procedure Hitung;
var i,s,b: integer;
begin
  clrscr;
  s := 0; b := 0;
  for i := 1 to n do
    if tugas[i].status='Selesai' then
      inc(s)
    else
      inc(b);
  writeln('Total Tugas Selesai : ',s);
  writeln('Total Tugas Belum   : ',b);
  readln;
end;

begin
  n := 0;

  repeat
    clrscr;
    writeln('   APLIKASI MANAJEMEN TUGAS HARIAN   ');
    writeln('======================================');
    writeln('1. Menambahkan Tugas Baru');
    writeln('2. Menampilkan Seluruh Daftar Tugas');
    writeln('3. Mengubah Status Tugas (Selesai/Belum)');
    writeln('4. Melihat Jumlah Tugas Selesai dan Belum');
    writeln('5. Keluar dari Program');
    writeln('--------------------------------------');
    write('Masukkan pilihan menu : ');
    readln(pil);

    case pil of     { Percabangan menu sesuai pilihan user }
      1: Tambah;
      2: Tampil;
      3: Ubah;
      4: Hitung;
    end;
  until pil = 5;  { Perulangan berhenti jika user memilih keluar }
end.
