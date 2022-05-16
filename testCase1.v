memory[0] = 10'b0000_110010; // LOD 50, (ACC = *50), Hex = 32
memory[1] = 10'b0010_110011; // ADD 51, ACC = ACC + (*51), Hex = B3
memory[2] = 10'b0001_110100; // STO 52, (*52) = ACC, Hex = 74
memory[3] = 10'b1001_000000; // Halt, Hex = 240
memory[50] = 10'b0000_000101; // Hex = 5
memory[51] = 10'b0000_001010; // Hex = A  