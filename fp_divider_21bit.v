`timescale 1ns / 1ps

module fp21_divider_top (
    input  wire [20:0] X,
    input  wire [20:0] Y,
    output wire [20:0] Q
);

    // --------------------------------------------------------
    // 1. Field Extraction
    // --------------------------------------------------------
    wire sx = X[20];
    wire sy = Y[20];

    wire [7:0] ex = X[19:12];
    wire [7:0] ey = Y[19:12];

    wire [11:0] mx = X[11:0];
    wire [11:0] my = Y[11:0];

    // --------------------------------------------------------
    // 2. Tile Indexing
    // --------------------------------------------------------
    wire [2:0] h = mx[11:9];
    wire [2:0] k = my[11:9];

    wire [8:0] dx = mx[8:0];
    wire [8:0] dy = my[8:0];

    // --------------------------------------------------------
    // 3. LUT (same coefficients)
    // --------------------------------------------------------
    reg signed [9:0] A,B;
    reg [11:0] C;

    always @(*) begin
        case({h,k})

            6'h00: begin A=10'sd120; B=-10'sd120; C=12'd1024; end
            6'h01: begin A=10'sd108; B=-10'sd96;  C=12'd910;  end
            6'h02: begin A=10'sd98;  B=-10'sd79;  C=12'd819;  end
            6'h03: begin A=10'sd89;  B=-10'sd66;  C=12'd745;  end
            6'h04: begin A=10'sd82;  B=-10'sd56;  C=12'd683;  end
            6'h05: begin A=10'sd76;  B=-10'sd48;  C=12'd630;  end
            6'h06: begin A=10'sd71;  B=-10'sd41;  C=12'd585;  end
            6'h07: begin A=10'sd66;  B=-10'sd36;  C=12'd546;  end

            6'h08: begin A=10'sd120; B=-10'sd135; C=12'd1152; end
            6'h09: begin A=10'sd108; B=-10'sd108; C=12'd1024; end
            6'h0A: begin A=10'sd98;  B=-10'sd88;  C=12'd922;  end
            6'h0B: begin A=10'sd89;  B=-10'sd74;  C=12'd838;  end
            6'h0C: begin A=10'sd82;  B=-10'sd62;  C=12'd768;  end
            6'h0D: begin A=10'sd76;  B=-10'sd53;  C=12'd709;  end
            6'h0E: begin A=10'sd71;  B=-10'sd46;  C=12'd658;  end
            6'h0F: begin A=10'sd66;  B=-10'sd40;  C=12'd614;  end

            6'h10: begin A=10'sd120; B=-10'sd149; C=12'd1280; end
            6'h11: begin A=10'sd108; B=-10'sd119; C=12'd1138; end
            6'h12: begin A=10'sd98;  B=-10'sd98;  C=12'd1024; end
            6'h13: begin A=10'sd89;  B=-10'sd81;  C=12'd931;  end
            6'h14: begin A=10'sd82;  B=-10'sd69;  C=12'd853;  end
            6'h15: begin A=10'sd76;  B=-10'sd59;  C=12'd788;  end
            6'h16: begin A=10'sd71;  B=-10'sd51;  C=12'd731;  end
            6'h17: begin A=10'sd66;  B=-10'sd45;  C=12'd683;  end

            6'h18: begin A=10'sd120; B=-10'sd163; C=12'd1408; end
            6'h19: begin A=10'sd108; B=-10'sd130; C=12'd1252; end
            6'h1A: begin A=10'sd98;  B=-10'sd107; C=12'd1126; end
            6'h1B: begin A=10'sd89;  B=-10'sd89;  C=12'd1024; end
            6'h1C: begin A=10'sd82;  B=-10'sd75;  C=12'd939;  end
            6'h1D: begin A=10'sd76;  B=-10'sd65;  C=12'd866;  end
            6'h1E: begin A=10'sd71;  B=-10'sd56;  C=12'd805;  end
            6'h1F: begin A=10'sd66;  B=-10'sd49;  C=12'd751;  end

            6'h20: begin A=10'sd120; B=-10'sd177; C=12'd1536; end
            6'h21: begin A=10'sd108; B=-10'sd142; C=12'd1365; end
            6'h22: begin A=10'sd98;  B=-10'sd116; C=12'd1229; end
            6'h23: begin A=10'sd89;  B=-10'sd97;  C=12'd1117; end
            6'h24: begin A=10'sd82;  B=-10'sd82;  C=12'd1024; end
            6'h25: begin A=10'sd76;  B=-10'sd70;  C=12'd945;  end
            6'h26: begin A=10'sd71;  B=-10'sd61;  C=12'd878;  end
            6'h27: begin A=10'sd66;  B=-10'sd53;  C=12'd819;  end

            6'h28: begin A=10'sd120; B=-10'sd191; C=12'd1664; end
            6'h29: begin A=10'sd108; B=-10'sd153; C=12'd1479; end
            6'h2A: begin A=10'sd98;  B=-10'sd125; C=12'd1331; end
            6'h2B: begin A=10'sd89;  B=-10'sd105; C=12'd1210; end
            6'h2C: begin A=10'sd82;  B=-10'sd88;  C=12'd1109; end
            6'h2D: begin A=10'sd76;  B=-10'sd76;  C=12'd1024; end
            6'h2E: begin A=10'sd71;  B=-10'sd66;  C=12'd951;  end
            6'h2F: begin A=10'sd66;  B=-10'sd58;  C=12'd887;  end

            6'h30: begin A=10'sd120; B=-10'sd206; C=12'd1792; end
            6'h31: begin A=10'sd108; B=-10'sd165; C=12'd1593; end
            6'h32: begin A=10'sd98;  B=-10'sd135; C=12'd1434; end
            6'h33: begin A=10'sd89;  B=-10'sd112; C=12'd1303; end
            6'h34: begin A=10'sd82;  B=-10'sd95;  C=12'd1195; end
            6'h35: begin A=10'sd76;  B=-10'sd81;  C=12'd1103; end
            6'h36: begin A=10'sd71;  B=-10'sd71;  C=12'd1024; end
            6'h37: begin A=10'sd66;  B=-10'sd62;  C=12'd956;  end

            6'h38: begin A=10'sd120; B=-10'sd220; C=12'd1920; end
            6'h39: begin A=10'sd108; B=-10'sd176; C=12'd1707; end
            6'h3A: begin A=10'sd98;  B=-10'sd144; C=12'd1536; end
            6'h3B: begin A=10'sd89;  B=-10'sd120; C=12'd1396; end
            6'h3C: begin A=10'sd82;  B=-10'sd102; C=12'd1280; end
            6'h3D: begin A=10'sd76;  B=-10'sd87;  C=12'd1182; end
            6'h3E: begin A=10'sd71;  B=-10'sd75;  C=12'd1097; end
            6'h3F: begin A=10'sd66;  B=-10'sd66;  C=12'd1024; end
            default: begin A=10'sd0; B=10'sd0; C=12'd1024; end
        endcase
    end

    // --------------------------------------------------------
    // 4. Fixed Point Arithmetic
    // --------------------------------------------------------
    wire signed [24:0] term_a = $signed({1'b0,dx}) * A;
    wire signed [24:0] term_b = $signed({1'b0,dy}) * B;
    wire signed [24:0] term_c = $signed({1'b0,C}) << 9;

    wire signed [24:0] P_sum = term_a + term_b + term_c;

    // --------------------------------------------------------
    // 5. Normalization
    // --------------------------------------------------------
    localparam signed [24:0] ONE_VAL = 25'd524288;

    reg [11:0] q_mant;
    reg signed [8:0] exp_adj;

    always @(*) begin
        if(P_sum < ONE_VAL) begin
            q_mant  = P_sum[20:9];
            exp_adj = -1;
        end
        else begin
            q_mant  = P_sum[21:10];
            exp_adj = 0;
        end
    end

    // --------------------------------------------------------
    // 6. Exponent Calculation
    // --------------------------------------------------------
    wire [7:0] ez = ex - ey + 8'd127 + exp_adj;

    wire div_by_zero = (Y[19:0] == 0);

    assign Q = div_by_zero ? 21'h0FF000 :
                             {sx ^ sy, ez, q_mant};

endmodule
