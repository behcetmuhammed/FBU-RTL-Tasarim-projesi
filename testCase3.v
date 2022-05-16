memory[0]= 10'b0000_110011; // LOD 51, ACC = *51, Hex = 33
memory[1]= 10'b0011_110001; // SUB 49, ACC = ACC - *49, Hex = F1
memory[2]= 10'b0111_001010; // JMZ 10, d�ng� bittiyse, d�ng�den ��kartacakt�r (ACC-49 == 0), 10. Sat�r, Hex = 1CA
memory[3]= 10'b0000_110000; // LOD 48, temp de�erini y�kle, ba�lang��ta 0, Hex = 30
memory[4]= 10'b0010_110010; // ADD 50, ikinci say�y� ACC'nin �st�ne ekle, Hex = B2
memory[5]= 10'b0001_110000; // STO 48, ACC'nin de�erini temp'e ata, Hex = 70
memory[6]= 10'b0000_110001; // LOD 49, ACC = i, Hex = 31
memory[7]= 10'b0010_101110; // ADD 46, ACC = i + 1, Hex = AE
memory[8]= 10'b0001_110001; // STO 49, i = i + 1, Hex = 71
memory[9]= 10'b0110_000000; // JMP 0, d�ng�n�n ba��na d�n 0. sat�r, Hex = 180
memory[10]= 10'b0000_110000; // LOD 48, ACC = temp, Hex = 30
memory[11]= 10'b0001_110100; // STO 52, *52 = ACC, Hex = 74
memory[12]= 10'b1001_000000;// HLT, bitirme, Hex = 240

memory[46]= 10'b1; // 1 say�s�
memory[48]= 10'b0; // Hex = 0, temp
memory[49]= 10'b0; // Hex = 0, i index'i i�in
memory[50]= 10'b0000000101; // Hex = 5
memory[51]= 10'b0000001010; // Hex = A

