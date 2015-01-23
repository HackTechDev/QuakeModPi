.vector paq_origin;
.float paqman;
.float paqman_frame;
.float paq_score;
.float paq_lives;
.float paq_i;
.float paq_j;
.float paq_moved;
.float paq_direction;
.float paq_dead;
.float paq_pilltime;
.float num_dots;
.float ghost_score;

.float ghost1_i;
.float ghost1_j;
.float ghost1_last_i;
.float ghost1_last_j;
.float ghost1;
.float ghost1_dead;
.float ghost2_i;
.float ghost2_j;
.float ghost2_last_i;
.float ghost2_last_j;
.float ghost2;
.float ghost2_dead;
.float ghost3_i;
.float ghost3_j;
.float ghost3_last_i;
.float ghost3_last_j;
.float ghost3;
.float ghost3_dead;
.float ghost4_i;
.float ghost4_j;
.float ghost4_last_i;
.float ghost4_last_j;
.float ghost4;
.float ghost4_dead;
float ghost_new_i;
float ghost_new_j;
float ghost_old_i;
float ghost_old_j;
float ghost_new;
float ghost_dead;

float PAQ_LEFT = 1;
float PAQ_RIGHT = 2;
float PAQ_UP = 3;
float PAQ_DOWN = 4;
float PAQKEY_UP = 1;
float PAQKEY_DOWN = 2;
float PAQKEY_LEFT = 4;
float PAQKEY_RIGHT = 8;
float SVC_CENTERPRINT = 26;


float a_1_1, a_1_2, a_1_3, a_1_4, a_1_5, a_1_6, a_1_7, a_1_8, a_1_9, a_1_10, a_1_11, a_1_12, a_1_13, a_1_14, a_1_15, a_1_16, a_1_17, a_1_18, a_1_19, a_1_20;
float a_2_1, a_2_2, a_2_3, a_2_4, a_2_5, a_2_6, a_2_7, a_2_8, a_2_9, a_2_10, a_2_11, a_2_12, a_2_13, a_2_14, a_2_15, a_2_16, a_2_17, a_2_18, a_2_19, a_2_20;
float a_3_1, a_3_2, a_3_3, a_3_4, a_3_5, a_3_6, a_3_7, a_3_8, a_3_9, a_3_10, a_3_11, a_3_12, a_3_13, a_3_14, a_3_15, a_3_16, a_3_17, a_3_18, a_3_19, a_3_20;
float a_4_1, a_4_2, a_4_3, a_4_4, a_4_5, a_4_6, a_4_7, a_4_8, a_4_9, a_4_10, a_4_11, a_4_12, a_4_13, a_4_14, a_4_15, a_4_16, a_4_17, a_4_18, a_4_19, a_4_20;
float a_5_1, a_5_2, a_5_3, a_5_4, a_5_5, a_5_6, a_5_7, a_5_8, a_5_9, a_5_10, a_5_11, a_5_12, a_5_13, a_5_14, a_5_15, a_5_16, a_5_17, a_5_18, a_5_19, a_5_20;
float a_6_1, a_6_2, a_6_3, a_6_4, a_6_5, a_6_6, a_6_7, a_6_8, a_6_9, a_6_10, a_6_11, a_6_12, a_6_13, a_6_14, a_6_15, a_6_16, a_6_17, a_6_18, a_6_19, a_6_20;
float a_7_1, a_7_2, a_7_3, a_7_4, a_7_5, a_7_6, a_7_7, a_7_8, a_7_9, a_7_10, a_7_11, a_7_12, a_7_13, a_7_14, a_7_15, a_7_16, a_7_17, a_7_18, a_7_19, a_7_20;
float a_8_1, a_8_2, a_8_3, a_8_4, a_8_5, a_8_6, a_8_7, a_8_8, a_8_9, a_8_10, a_8_11, a_8_12, a_8_13, a_8_14, a_8_15, a_8_16, a_8_17, a_8_18, a_8_19, a_8_20;
float a_9_1, a_9_2, a_9_3, a_9_4, a_9_5, a_9_6, a_9_7, a_9_8, a_9_9, a_9_10, a_9_11, a_9_12, a_9_13, a_9_14, a_9_15, a_9_16, a_9_17, a_9_18, a_9_19, a_9_20;
float a_10_1, a_10_2, a_10_3, a_10_4, a_10_5, a_10_6, a_10_7, a_10_8, a_10_9, a_10_10, a_10_11, a_10_12, a_10_13, a_10_14, a_10_15, a_10_16, a_10_17, a_10_18, a_10_19, a_10_20;
float a_11_1, a_11_2, a_11_3, a_11_4, a_11_5, a_11_6, a_11_7, a_11_8, a_11_9, a_11_10, a_11_11, a_11_12, a_11_13, a_11_14, a_11_15, a_11_16, a_11_17, a_11_18, a_11_19, a_11_20;
float a_12_1, a_12_2, a_12_3, a_12_4, a_12_5, a_12_6, a_12_7, a_12_8, a_12_9, a_12_10, a_12_11, a_12_12, a_12_13, a_12_14, a_12_15, a_12_16, a_12_17, a_12_18, a_12_19, a_12_20;
float a_13_1, a_13_2, a_13_3, a_13_4, a_13_5, a_13_6, a_13_7, a_13_8, a_13_9, a_13_10, a_13_11, a_13_12, a_13_13, a_13_14, a_13_15, a_13_16, a_13_17, a_13_18, a_13_19, a_13_20;
float a_14_1, a_14_2, a_14_3, a_14_4, a_14_5, a_14_6, a_14_7, a_14_8, a_14_9, a_14_10, a_14_11, a_14_12, a_14_13, a_14_14, a_14_15, a_14_16, a_14_17, a_14_18, a_14_19, a_14_20;
float a_15_1, a_15_2, a_15_3, a_15_4, a_15_5, a_15_6, a_15_7, a_15_8, a_15_9, a_15_10, a_15_11, a_15_12, a_15_13, a_15_14, a_15_15, a_15_16, a_15_17, a_15_18, a_15_19, a_15_20;
float a_16_1, a_16_2, a_16_3, a_16_4, a_16_5, a_16_6, a_16_7, a_16_8, a_16_9, a_16_10, a_16_11, a_16_12, a_16_13, a_16_14, a_16_15, a_16_16, a_16_17, a_16_18, a_16_19, a_16_20;
float a_17_1, a_17_2, a_17_3, a_17_4, a_17_5, a_17_6, a_17_7, a_17_8, a_17_9, a_17_10, a_17_11, a_17_12, a_17_13, a_17_14, a_17_15, a_17_16, a_17_17, a_17_18, a_17_19, a_17_20;
float a_18_1, a_18_2, a_18_3, a_18_4, a_18_5, a_18_6, a_18_7, a_18_8, a_18_9, a_18_10, a_18_11, a_18_12, a_18_13, a_18_14, a_18_15, a_18_16, a_18_17, a_18_18, a_18_19, a_18_20;
float a_19_1, a_19_2, a_19_3, a_19_4, a_19_5, a_19_6, a_19_7, a_19_8, a_19_9, a_19_10, a_19_11, a_19_12, a_19_13, a_19_14, a_19_15, a_19_16, a_19_17, a_19_18, a_19_19, a_19_20;
float a_20_1, a_20_2, a_20_3, a_20_4, a_20_5, a_20_6, a_20_7, a_20_8, a_20_9, a_20_10, a_20_11, a_20_12, a_20_13, a_20_14, a_20_15, a_20_16, a_20_17, a_20_18, a_20_19, a_20_20;
	
float(float i, float j) array_a =
{
	if (i == 1)
	{
		if (j == 1)	return a_1_1;
		if (j == 2)	return a_1_2;
		if (j == 3)	return a_1_3;
		if (j == 4)	return a_1_4;
		if (j == 5)	return a_1_5;
		if (j == 6)	return a_1_6;
		if (j == 7)	return a_1_7;
		if (j == 8)	return a_1_8;
		if (j == 9)	return a_1_9;
		if (j == 10)	return a_1_10;
		if (j == 11)	return a_1_11;
		if (j == 12)	return a_1_12;
		if (j == 13)	return a_1_13;
		if (j == 14)	return a_1_14;
		if (j == 15)	return a_1_15;
		if (j == 16)	return a_1_16;
		if (j == 17)	return a_1_17;
		if (j == 18)	return a_1_18;
		if (j == 19)	return a_1_19;
		if (j == 20)	return a_1_20;
	}
	if (i == 2)
	{
		if (j == 1)	return a_2_1;
		if (j == 2)	return a_2_2;
		if (j == 3)	return a_2_3;
		if (j == 4)	return a_2_4;
		if (j == 5)	return a_2_5;
		if (j == 6)	return a_2_6;
		if (j == 7)	return a_2_7;
		if (j == 8)	return a_2_8;
		if (j == 9)	return a_2_9;
		if (j == 10)	return a_2_10;
		if (j == 11)	return a_2_11;
		if (j == 12)	return a_2_12;
		if (j == 13)	return a_2_13;
		if (j == 14)	return a_2_14;
		if (j == 15)	return a_2_15;
		if (j == 16)	return a_2_16;
		if (j == 17)	return a_2_17;
		if (j == 18)	return a_2_18;
		if (j == 19)	return a_2_19;
		if (j == 20)	return a_2_20;
	}
	if (i == 3)
	{
		if (j == 1)	return a_3_1;
		if (j == 2)	return a_3_2;
		if (j == 3)	return a_3_3;
		if (j == 4)	return a_3_4;
		if (j == 5)	return a_3_5;
		if (j == 6)	return a_3_6;
		if (j == 7)	return a_3_7;
		if (j == 8)	return a_3_8;
		if (j == 9)	return a_3_9;
		if (j == 10)	return a_3_10;
		if (j == 11)	return a_3_11;
		if (j == 12)	return a_3_12;
		if (j == 13)	return a_3_13;
		if (j == 14)	return a_3_14;
		if (j == 15)	return a_3_15;
		if (j == 16)	return a_3_16;
		if (j == 17)	return a_3_17;
		if (j == 18)	return a_3_18;
		if (j == 19)	return a_3_19;
		if (j == 20)	return a_3_20;

	}
	if (i == 4)
	{
		if (j == 1)	return a_4_1;
		if (j == 2)	return a_4_2;
		if (j == 3)	return a_4_3;
		if (j == 4)	return a_4_4;
		if (j == 5)	return a_4_5;
		if (j == 6)	return a_4_6;
		if (j == 7)	return a_4_7;
		if (j == 8)	return a_4_8;
		if (j == 9)	return a_4_9;
		if (j == 10)	return a_4_10;
		if (j == 11)	return a_4_11;
		if (j == 12)	return a_4_12;
		if (j == 13)	return a_4_13;
		if (j == 14)	return a_4_14;
		if (j == 15)	return a_4_15;
		if (j == 16)	return a_4_16;
		if (j == 17)	return a_4_17;
		if (j == 18)	return a_4_18;
		if (j == 19)	return a_4_19;
		if (j == 20)	return a_4_20;
	}
	if (i == 5)
	{
		if (j == 1)	return a_5_1;
		if (j == 2)	return a_5_2;
		if (j == 3)	return a_5_3;
		if (j == 4)	return a_5_4;
		if (j == 5)	return a_5_5;
		if (j == 6)	return a_5_6;
		if (j == 7)	return a_5_7;
		if (j == 8)	return a_5_8;
		if (j == 9)	return a_5_9;
		if (j == 10)	return a_5_10;
		if (j == 11)	return a_5_11;
		if (j == 12)	return a_5_12;
		if (j == 13)	return a_5_13;
		if (j == 14)	return a_5_14;
		if (j == 15)	return a_5_15;
		if (j == 16)	return a_5_16;
		if (j == 17)	return a_5_17;
		if (j == 18)	return a_5_18;
		if (j == 19)	return a_5_19;
		if (j == 20)	return a_5_20;
	}
	if (i == 6)
	{
		if (j == 1)	return a_6_1;
		if (j == 2)	return a_6_2;
		if (j == 3)	return a_6_3;
		if (j == 4)	return a_6_4;
		if (j == 5)	return a_6_5;
		if (j == 6)	return a_6_6;
		if (j == 7)	return a_6_7;
		if (j == 8)	return a_6_8;
		if (j == 9)	return a_6_9;
		if (j == 10)	return a_6_10;
		if (j == 11)	return a_6_11;
		if (j == 12)	return a_6_12;
		if (j == 13)	return a_6_13;
		if (j == 14)	return a_6_14;
		if (j == 15)	return a_6_15;
		if (j == 16)	return a_6_16;
		if (j == 17)	return a_6_17;
		if (j == 18)	return a_6_18;
		if (j == 19)	return a_6_19;
		if (j == 20)	return a_6_20;
	}
	if (i == 7)
	{
		if (j == 1)	return a_7_1;
		if (j == 2)	return a_7_2;
		if (j == 3)	return a_7_3;
		if (j == 4)	return a_7_4;
		if (j == 5)	return a_7_5;
		if (j == 6)	return a_7_6;
		if (j == 7)	return a_7_7;
		if (j == 8)	return a_7_8;
		if (j == 9)	return a_7_9;
		if (j == 10)	return a_7_10;
		if (j == 11)	return a_7_11;
		if (j == 12)	return a_7_12;
		if (j == 13)	return a_7_13;
		if (j == 14)	return a_7_14;
		if (j == 15)	return a_7_15;
		if (j == 16)	return a_7_16;
		if (j == 17)	return a_7_17;
		if (j == 18)	return a_7_18;
		if (j == 19)	return a_7_19;
		if (j == 20)	return a_7_20;
	}
	if (i == 8)
	{
		if (j == 1)	return a_8_1;
		if (j == 2)	return a_8_2;
		if (j == 3)	return a_8_3;
		if (j == 4)	return a_8_4;
		if (j == 5)	return a_8_5;
		if (j == 6)	return a_8_6;
		if (j == 7)	return a_8_7;
		if (j == 8)	return a_8_8;
		if (j == 9)	return a_8_9;
		if (j == 10)	return a_8_10;
		if (j == 11)	return a_8_11;
		if (j == 12)	return a_8_12;
		if (j == 13)	return a_8_13;
		if (j == 14)	return a_8_14;
		if (j == 15)	return a_8_15;
		if (j == 16)	return a_8_16;
		if (j == 17)	return a_8_17;
		if (j == 18)	return a_8_18;
		if (j == 19)	return a_8_19;
		if (j == 20)	return a_8_20;
	}
	if (i == 9)
	{
		if (j == 1)	return a_9_1;
		if (j == 2)	return a_9_2;
		if (j == 3)	return a_9_3;
		if (j == 4)	return a_9_4;
		if (j == 5)	return a_9_5;
		if (j == 6)	return a_9_6;
		if (j == 7)	return a_9_7;
		if (j == 8)	return a_9_8;
		if (j == 9)	return a_9_9;
		if (j == 10)	return a_9_10;
		if (j == 11)	return a_9_11;
		if (j == 12)	return a_9_12;
		if (j == 13)	return a_9_13;
		if (j == 14)	return a_9_14;
		if (j == 15)	return a_9_15;
		if (j == 16)	return a_9_16;
		if (j == 17)	return a_9_17;
		if (j == 18)	return a_9_18;
		if (j == 19)	return a_9_19;
		if (j == 20)	return a_9_20;
	}
	if (i == 10)
	{
		if (j == 1)	return a_10_1;
		if (j == 2)	return a_10_2;
		if (j == 3)	return a_10_3;
		if (j == 4)	return a_10_4;
		if (j == 5)	return a_10_5;
		if (j == 6)	return a_10_6;
		if (j == 7)	return a_10_7;
		if (j == 8)	return a_10_8;
		if (j == 9)	return a_10_9;
		if (j == 10)	return a_10_10;
		if (j == 11)	return a_10_11;
		if (j == 12)	return a_10_12;
		if (j == 13)	return a_10_13;
		if (j == 14)	return a_10_14;
		if (j == 15)	return a_10_15;
		if (j == 16)	return a_10_16;
		if (j == 17)	return a_10_17;
		if (j == 18)	return a_10_18;
		if (j == 19)	return a_10_19;
		if (j == 20)	return a_10_20;
	}
	if (i == 11)
	{
		if (j == 1)	return a_11_1;
		if (j == 2)	return a_11_2;
		if (j == 3)	return a_11_3;
		if (j == 4)	return a_11_4;
		if (j == 5)	return a_11_5;
		if (j == 6)	return a_11_6;
		if (j == 7)	return a_11_7;
		if (j == 8)	return a_11_8;
		if (j == 9)	return a_11_9;
		if (j == 10)	return a_11_10;
		if (j == 11)	return a_11_11;
		if (j == 12)	return a_11_12;
		if (j == 13)	return a_11_13;
		if (j == 14)	return a_11_14;
		if (j == 15)	return a_11_15;
		if (j == 16)	return a_11_16;
		if (j == 17)	return a_11_17;
		if (j == 18)	return a_11_18;
		if (j == 19)	return a_11_19;
		if (j == 20)	return a_11_20;
	}
	if (i == 12)
	{
		if (j == 1)	return a_12_1;
		if (j == 2)	return a_12_2;
		if (j == 3)	return a_12_3;
		if (j == 4)	return a_12_4;
		if (j == 5)	return a_12_5;
		if (j == 6)	return a_12_6;
		if (j == 7)	return a_12_7;
		if (j == 8)	return a_12_8;
		if (j == 9)	return a_12_9;
		if (j == 10)	return a_12_10;
		if (j == 11)	return a_12_11;
		if (j == 12)	return a_12_12;
		if (j == 13)	return a_12_13;
		if (j == 14)	return a_12_14;
		if (j == 15)	return a_12_15;
		if (j == 16)	return a_12_16;
		if (j == 17)	return a_12_17;
		if (j == 18)	return a_12_18;
		if (j == 19)	return a_12_19;
		if (j == 20)	return a_12_20;
	}
	if (i == 13)
	{
		if (j == 1)	return a_13_1;
		if (j == 2)	return a_13_2;
		if (j == 3)	return a_13_3;
		if (j == 4)	return a_13_4;
		if (j == 5)	return a_13_5;
		if (j == 6)	return a_13_6;
		if (j == 7)	return a_13_7;
		if (j == 8)	return a_13_8;
		if (j == 9)	return a_13_9;
		if (j == 10)	return a_13_10;
		if (j == 11)	return a_13_11;
		if (j == 12)	return a_13_12;
		if (j == 13)	return a_13_13;
		if (j == 14)	return a_13_14;
		if (j == 15)	return a_13_15;
		if (j == 16)	return a_13_16;
		if (j == 17)	return a_13_17;
		if (j == 18)	return a_13_18;
		if (j == 19)	return a_13_19;
		if (j == 20)	return a_13_20;
	}
	if (i == 14)
	{
		if (j == 1)	return a_14_1;
		if (j == 2)	return a_14_2;
		if (j == 3)	return a_14_3;
		if (j == 4)	return a_14_4;
		if (j == 5)	return a_14_5;
		if (j == 6)	return a_14_6;
		if (j == 7)	return a_14_7;
		if (j == 8)	return a_14_8;
		if (j == 9)	return a_14_9;
		if (j == 10)	return a_14_10;
		if (j == 11)	return a_14_11;
		if (j == 12)	return a_14_12;
		if (j == 13)	return a_14_13;
		if (j == 14)	return a_14_14;
		if (j == 15)	return a_14_15;
		if (j == 16)	return a_14_16;
		if (j == 17)	return a_14_17;
		if (j == 18)	return a_14_18;
		if (j == 19)	return a_14_19;
		if (j == 20)	return a_14_20;
	}
	if (i == 15)
	{
		if (j == 1)	return a_15_1;
		if (j == 2)	return a_15_2;
		if (j == 3)	return a_15_3;
		if (j == 4)	return a_15_4;
		if (j == 5)	return a_15_5;
		if (j == 6)	return a_15_6;
		if (j == 7)	return a_15_7;
		if (j == 8)	return a_15_8;
		if (j == 9)	return a_15_9;
		if (j == 10)	return a_15_10;
		if (j == 11)	return a_15_11;
		if (j == 12)	return a_15_12;
		if (j == 13)	return a_15_13;
		if (j == 14)	return a_15_14;
		if (j == 15)	return a_15_15;
		if (j == 16)	return a_15_16;
		if (j == 17)	return a_15_17;
		if (j == 18)	return a_15_18;
		if (j == 19)	return a_15_19;
		if (j == 20)	return a_15_20;
	}
	if (i == 16)
	{
		if (j == 1)	return a_16_1;
		if (j == 2)	return a_16_2;
		if (j == 3)	return a_16_3;
		if (j == 4)	return a_16_4;
		if (j == 5)	return a_16_5;
		if (j == 6)	return a_16_6;
		if (j == 7)	return a_16_7;
		if (j == 8)	return a_16_8;
		if (j == 9)	return a_16_9;
		if (j == 10)	return a_16_10;
		if (j == 11)	return a_16_11;
		if (j == 12)	return a_16_12;
		if (j == 13)	return a_16_13;
		if (j == 14)	return a_16_14;
		if (j == 15)	return a_16_15;
		if (j == 16)	return a_16_16;
		if (j == 17)	return a_16_17;
		if (j == 18)	return a_16_18;
		if (j == 19)	return a_16_19;
		if (j == 20)	return a_16_20;
	}
	if (i == 17)
	{
		if (j == 1)	return a_17_1;
		if (j == 2)	return a_17_2;
		if (j == 3)	return a_17_3;
		if (j == 4)	return a_17_4;
		if (j == 5)	return a_17_5;
		if (j == 6)	return a_17_6;
		if (j == 7)	return a_17_7;
		if (j == 8)	return a_17_8;
		if (j == 9)	return a_17_9;
		if (j == 10)	return a_17_10;
		if (j == 11)	return a_17_11;
		if (j == 12)	return a_17_12;
		if (j == 13)	return a_17_13;
		if (j == 14)	return a_17_14;
		if (j == 15)	return a_17_15;
		if (j == 16)	return a_17_16;
		if (j == 17)	return a_17_17;
		if (j == 18)	return a_17_18;
		if (j == 19)	return a_17_19;
		if (j == 20)	return a_17_20;
	}
	if (i == 18)
	{
		if (j == 1)	return a_18_1;
		if (j == 2)	return a_18_2;
		if (j == 3)	return a_18_3;
		if (j == 4)	return a_18_4;
		if (j == 5)	return a_18_5;
		if (j == 6)	return a_18_6;
		if (j == 7)	return a_18_7;
		if (j == 8)	return a_18_8;
		if (j == 9)	return a_18_9;
		if (j == 10)	return a_18_10;
		if (j == 11)	return a_18_11;
		if (j == 12)	return a_18_12;
		if (j == 13)	return a_18_13;
		if (j == 14)	return a_18_14;
		if (j == 15)	return a_18_15;
		if (j == 16)	return a_18_16;
		if (j == 17)	return a_18_17;
		if (j == 18)	return a_18_18;
		if (j == 19)	return a_18_19;
		if (j == 20)	return a_18_20;
	}
	if (i == 19)
	{
		if (j == 1)	return a_19_1;
		if (j == 2)	return a_19_2;
		if (j == 3)	return a_19_3;
		if (j == 4)	return a_19_4;
		if (j == 5)	return a_19_5;
		if (j == 6)	return a_19_6;
		if (j == 7)	return a_19_7;
		if (j == 8)	return a_19_8;
		if (j == 9)	return a_19_9;
		if (j == 10)	return a_19_10;
		if (j == 11)	return a_19_11;
		if (j == 12)	return a_19_12;
		if (j == 13)	return a_19_13;
		if (j == 14)	return a_19_14;
		if (j == 15)	return a_19_15;
		if (j == 16)	return a_19_16;
		if (j == 17)	return a_19_17;
		if (j == 18)	return a_19_18;
		if (j == 19)	return a_19_19;
		if (j == 20)	return a_19_20;
	}
	if (i == 20)
	{
		if (j == 1)	return a_20_1;
		if (j == 2)	return a_20_2;
		if (j == 3)	return a_20_3;
		if (j == 4)	return a_20_4;
		if (j == 5)	return a_20_5;
		if (j == 6)	return a_20_6;
		if (j == 7)	return a_20_7;
		if (j == 8)	return a_20_8;
		if (j == 9)	return a_20_9;
		if (j == 10)	return a_20_10;
		if (j == 11)	return a_20_11;
		if (j == 12)	return a_20_12;
		if (j == 13)	return a_20_13;
		if (j == 14)	return a_20_14;
		if (j == 15)	return a_20_15;
		if (j == 16)	return a_20_16;
		if (j == 17)	return a_20_17;
		if (j == 18)	return a_20_18;
		if (j == 19)	return a_20_19;
		if (j == 20)	return a_20_20;
	}

	return 0;
};

void (float i, float j, float val) set_array_a =
{
	if (i == 1)
	{
		if (j == 1)	{ a_1_1 = val; return; }
		if (j == 2)	{ a_1_2 = val; return; }
		if (j == 3)	{ a_1_3 = val; return; }
		if (j == 4)	{ a_1_4 = val; return; }
		if (j == 5)	{ a_1_5 = val; return; }
		if (j == 6)	{ a_1_6 = val; return; }
		if (j == 7)	{ a_1_7 = val; return; }
		if (j == 8)	{ a_1_8 = val; return; }
		if (j == 9)	{ a_1_9 = val; return; }
		if (j == 10)	{ a_1_10 = val; return; }
		if (j == 11)	{ a_1_11 = val; return; }
		if (j == 12)	{ a_1_12 = val; return; }
		if (j == 13)	{ a_1_13 = val; return; }
		if (j == 14)	{ a_1_14 = val; return; }
		if (j == 15)	{ a_1_15 = val; return; }
		if (j == 16)	{ a_1_16 = val; return; }
		if (j == 17)	{ a_1_17 = val; return; }
		if (j == 18)	{ a_1_18 = val; return; }
		if (j == 19)	{ a_1_19 = val; return; }
		if (j == 20)	{ a_1_20 = val; return; }
	}
	if (i == 2)
	{
		if (j == 1)	{ a_2_1 = val; return; }
		if (j == 2)	{ a_2_2 = val; return; }
		if (j == 3)	{ a_2_3 = val; return; }
		if (j == 4)	{ a_2_4 = val; return; }
		if (j == 5)	{ a_2_5 = val; return; }
		if (j == 6)	{ a_2_6 = val; return; }
		if (j == 7)	{ a_2_7 = val; return; }
		if (j == 8)	{ a_2_8 = val; return; }
		if (j == 9)	{ a_2_9 = val; return; }
		if (j == 10)	{ a_2_10 = val; return; }
		if (j == 11)	{ a_2_11 = val; return; }
		if (j == 12)	{ a_2_12 = val; return; }
		if (j == 13)	{ a_2_13 = val; return; }
		if (j == 14)	{ a_2_14 = val; return; }
		if (j == 15)	{ a_2_15 = val; return; }
		if (j == 16)	{ a_2_16 = val; return; }
		if (j == 17)	{ a_2_17 = val; return; }
		if (j == 18)	{ a_2_18 = val; return; }
		if (j == 19)	{ a_2_19 = val; return; }
		if (j == 20)	{ a_2_20 = val; return; }
	}
	if (i == 3)
	{
		if (j == 1)	{ a_3_1 = val; return; }
		if (j == 2)	{ a_3_2 = val; return; }
		if (j == 3)	{ a_3_3 = val; return; }
		if (j == 4)	{ a_3_4 = val; return; }
		if (j == 5)	{ a_3_5 = val; return; }
		if (j == 6)	{ a_3_6 = val; return; }
		if (j == 7)	{ a_3_7 = val; return; }
		if (j == 8)	{ a_3_8 = val; return; }
		if (j == 9)	{ a_3_9 = val; return; }
		if (j == 10)	{ a_3_10 = val; return; }
		if (j == 11)	{ a_3_11 = val; return; }
		if (j == 12)	{ a_3_12 = val; return; }
		if (j == 13)	{ a_3_13 = val; return; }
		if (j == 14)	{ a_3_14 = val; return; }
		if (j == 15)	{ a_3_15 = val; return; }
		if (j == 16)	{ a_3_16 = val; return; }
		if (j == 17)	{ a_3_17 = val; return; }
		if (j == 18)	{ a_3_18 = val; return; }
		if (j == 19)	{ a_3_19 = val; return; }
		if (j == 20)	{ a_3_20 = val; return; }
	}
	if (i == 4)
	{
		if (j == 1)	{ a_4_1 = val; return; }
		if (j == 2)	{ a_4_2 = val; return; }
		if (j == 3)	{ a_4_3 = val; return; }
		if (j == 4)	{ a_4_4 = val; return; }
		if (j == 5)	{ a_4_5 = val; return; }
		if (j == 6)	{ a_4_6 = val; return; }
		if (j == 7)	{ a_4_7 = val; return; }
		if (j == 8)	{ a_4_8 = val; return; }
		if (j == 9)	{ a_4_9 = val; return; }
		if (j == 10)	{ a_4_10 = val; return; }
		if (j == 11)	{ a_4_11 = val; return; }
		if (j == 12)	{ a_4_12 = val; return; }
		if (j == 13)	{ a_4_13 = val; return; }
		if (j == 14)	{ a_4_14 = val; return; }
		if (j == 15)	{ a_4_15 = val; return; }
		if (j == 16)	{ a_4_16 = val; return; }
		if (j == 17)	{ a_4_17 = val; return; }
		if (j == 18)	{ a_4_18 = val; return; }
		if (j == 19)	{ a_4_19 = val; return; }
		if (j == 20)	{ a_4_20 = val; return; }
	}
	if (i == 5)
	{
		if (j == 1)	{ a_5_1 = val; return; }
		if (j == 2)	{ a_5_2 = val; return; }
		if (j == 3)	{ a_5_3 = val; return; }
		if (j == 4)	{ a_5_4 = val; return; }
		if (j == 5)	{ a_5_5 = val; return; }
		if (j == 6)	{ a_5_6 = val; return; }
		if (j == 7)	{ a_5_7 = val; return; }
		if (j == 8)	{ a_5_8 = val; return; }
		if (j == 9)	{ a_5_9 = val; return; }
		if (j == 10)	{ a_5_10 = val; return; }
		if (j == 11)	{ a_5_11 = val; return; }
		if (j == 12)	{ a_5_12 = val; return; }
		if (j == 13)	{ a_5_13 = val; return; }
		if (j == 14)	{ a_5_14 = val; return; }
		if (j == 15)	{ a_5_15 = val; return; }
		if (j == 16)	{ a_5_16 = val; return; }
		if (j == 17)	{ a_5_17 = val; return; }
		if (j == 18)	{ a_5_18 = val; return; }
		if (j == 19)	{ a_5_19 = val; return; }
		if (j == 20)	{ a_5_20 = val; return; }
	}
	if (i == 6)
	{
		if (j == 1)	{ a_6_1 = val; return; }
		if (j == 2)	{ a_6_2 = val; return; }
		if (j == 3)	{ a_6_3 = val; return; }
		if (j == 4)	{ a_6_4 = val; return; }
		if (j == 5)	{ a_6_5 = val; return; }
		if (j == 6)	{ a_6_6 = val; return; }
		if (j == 7)	{ a_6_7 = val; return; }
		if (j == 8)	{ a_6_8 = val; return; }
		if (j == 9)	{ a_6_9 = val; return; }
		if (j == 10)	{ a_6_10 = val; return; }
		if (j == 11)	{ a_6_11 = val; return; }
		if (j == 12)	{ a_6_12 = val; return; }
		if (j == 13)	{ a_6_13 = val; return; }
		if (j == 14)	{ a_6_14 = val; return; }
		if (j == 15)	{ a_6_15 = val; return; }
		if (j == 16)	{ a_6_16 = val; return; }
		if (j == 17)	{ a_6_17 = val; return; }
		if (j == 18)	{ a_6_18 = val; return; }
		if (j == 19)	{ a_6_19 = val; return; }
		if (j == 20)	{ a_6_20 = val; return; }
	}
	if (i == 7)
	{
		if (j == 1)	{ a_7_1 = val; return; }
		if (j == 2)	{ a_7_2 = val; return; }
		if (j == 3)	{ a_7_3 = val; return; }
		if (j == 4)	{ a_7_4 = val; return; }
		if (j == 5)	{ a_7_5 = val; return; }
		if (j == 6)	{ a_7_6 = val; return; }
		if (j == 7)	{ a_7_7 = val; return; }
		if (j == 8)	{ a_7_8 = val; return; }
		if (j == 9)	{ a_7_9 = val; return; }
		if (j == 10)	{ a_7_10 = val; return; }
		if (j == 11)	{ a_7_11 = val; return; }
		if (j == 12)	{ a_7_12 = val; return; }
		if (j == 13)	{ a_7_13 = val; return; }
		if (j == 14)	{ a_7_14 = val; return; }
		if (j == 15)	{ a_7_15 = val; return; }
		if (j == 16)	{ a_7_16 = val; return; }
		if (j == 17)	{ a_7_17 = val; return; }
		if (j == 18)	{ a_7_18 = val; return; }
		if (j == 19)	{ a_7_19 = val; return; }
		if (j == 20)	{ a_7_20 = val; return; }
	}
	if (i == 8)
	{
		if (j == 1)	{ a_8_1 = val; return; }
		if (j == 2)	{ a_8_2 = val; return; }
		if (j == 3)	{ a_8_3 = val; return; }
		if (j == 4)	{ a_8_4 = val; return; }
		if (j == 5)	{ a_8_5 = val; return; }
		if (j == 6)	{ a_8_6 = val; return; }
		if (j == 7)	{ a_8_7 = val; return; }
		if (j == 8)	{ a_8_8 = val; return; }
		if (j == 9)	{ a_8_9 = val; return; }
		if (j == 10)	{ a_8_10 = val; return; }
		if (j == 11)	{ a_8_11 = val; return; }
		if (j == 12)	{ a_8_12 = val; return; }
		if (j == 13)	{ a_8_13 = val; return; }
		if (j == 14)	{ a_8_14 = val; return; }
		if (j == 15)	{ a_8_15 = val; return; }
		if (j == 16)	{ a_8_16 = val; return; }
		if (j == 17)	{ a_8_17 = val; return; }
		if (j == 18)	{ a_8_18 = val; return; }
		if (j == 19)	{ a_8_19 = val; return; }
		if (j == 20)	{ a_8_20 = val; return; }
	}
	if (i == 9)
	{
		if (j == 1)	{ a_9_1 = val; return; }
		if (j == 2)	{ a_9_2 = val; return; }
		if (j == 3)	{ a_9_3 = val; return; }
		if (j == 4)	{ a_9_4 = val; return; }
		if (j == 5)	{ a_9_5 = val; return; }
		if (j == 6)	{ a_9_6 = val; return; }
		if (j == 7)	{ a_9_7 = val; return; }
		if (j == 8)	{ a_9_8 = val; return; }
		if (j == 9)	{ a_9_9 = val; return; }
		if (j == 10)	{ a_9_10 = val; return; }
		if (j == 11)	{ a_9_11 = val; return; }
		if (j == 12)	{ a_9_12 = val; return; }
		if (j == 13)	{ a_9_13 = val; return; }
		if (j == 14)	{ a_9_14 = val; return; }
		if (j == 15)	{ a_9_15 = val; return; }
		if (j == 16)	{ a_9_16 = val; return; }
		if (j == 17)	{ a_9_17 = val; return; }
		if (j == 18)	{ a_9_18 = val; return; }
		if (j == 19)	{ a_9_19 = val; return; }
		if (j == 20)	{ a_9_20 = val; return; }
	}
	if (i == 10)
	{
		if (j == 1)	{ a_10_1 = val; return; }
		if (j == 2)	{ a_10_2 = val; return; }
		if (j == 3)	{ a_10_3 = val; return; }
		if (j == 4)	{ a_10_4 = val; return; }
		if (j == 5)	{ a_10_5 = val; return; }
		if (j == 6)	{ a_10_6 = val; return; }
		if (j == 7)	{ a_10_7 = val; return; }
		if (j == 8)	{ a_10_8 = val; return; }
		if (j == 9)	{ a_10_9 = val; return; }
		if (j == 10)	{ a_10_10 = val; return; }
		if (j == 11)	{ a_10_11 = val; return; }
		if (j == 12)	{ a_10_12 = val; return; }
		if (j == 13)	{ a_10_13 = val; return; }
		if (j == 14)	{ a_10_14 = val; return; }
		if (j == 15)	{ a_10_15 = val; return; }
		if (j == 16)	{ a_10_16 = val; return; }
		if (j == 17)	{ a_10_17 = val; return; }
		if (j == 18)	{ a_10_18 = val; return; }
		if (j == 19)	{ a_10_19 = val; return; }
		if (j == 20)	{ a_10_20 = val; return; }
	}
	if (i == 11)
	{
		if (j == 1)	{ a_11_1 = val; return; }
		if (j == 2)	{ a_11_2 = val; return; }
		if (j == 3)	{ a_11_3 = val; return; }
		if (j == 4)	{ a_11_4 = val; return; }
		if (j == 5)	{ a_11_5 = val; return; }
		if (j == 6)	{ a_11_6 = val; return; }
		if (j == 7)	{ a_11_7 = val; return; }
		if (j == 8)	{ a_11_8 = val; return; }
		if (j == 9)	{ a_11_9 = val; return; }
		if (j == 10)	{ a_11_10 = val; return; }
		if (j == 11)	{ a_11_11 = val; return; }
		if (j == 12)	{ a_11_12 = val; return; }
		if (j == 13)	{ a_11_13 = val; return; }
		if (j == 14)	{ a_11_14 = val; return; }
		if (j == 15)	{ a_11_15 = val; return; }
		if (j == 16)	{ a_11_16 = val; return; }
		if (j == 17)	{ a_11_17 = val; return; }
		if (j == 18)	{ a_11_18 = val; return; }
		if (j == 19)	{ a_11_19 = val; return; }
		if (j == 20)	{ a_11_20 = val; return; }
	}
	if (i == 12)
	{
		if (j == 1)	{ a_12_1 = val; return; }
		if (j == 2)	{ a_12_2 = val; return; }
		if (j == 3)	{ a_12_3 = val; return; }
		if (j == 4)	{ a_12_4 = val; return; }
		if (j == 5)	{ a_12_5 = val; return; }
		if (j == 6)	{ a_12_6 = val; return; }
		if (j == 7)	{ a_12_7 = val; return; }
		if (j == 8)	{ a_12_8 = val; return; }
		if (j == 9)	{ a_12_9 = val; return; }
		if (j == 10)	{ a_12_10 = val; return; }
		if (j == 11)	{ a_12_11 = val; return; }
		if (j == 12)	{ a_12_12 = val; return; }
		if (j == 13)	{ a_12_13 = val; return; }
		if (j == 14)	{ a_12_14 = val; return; }
		if (j == 15)	{ a_12_15 = val; return; }
		if (j == 16)	{ a_12_16 = val; return; }
		if (j == 17)	{ a_12_17 = val; return; }
		if (j == 18)	{ a_12_18 = val; return; }
		if (j == 19)	{ a_12_19 = val; return; }
		if (j == 20)	{ a_12_20 = val; return; }
	}
	if (i == 13)
	{
		if (j == 1)	{ a_13_1 = val; return; }
		if (j == 2)	{ a_13_2 = val; return; }
		if (j == 3)	{ a_13_3 = val; return; }
		if (j == 4)	{ a_13_4 = val; return; }
		if (j == 5)	{ a_13_5 = val; return; }
		if (j == 6)	{ a_13_6 = val; return; }
		if (j == 7)	{ a_13_7 = val; return; }
		if (j == 8)	{ a_13_8 = val; return; }
		if (j == 9)	{ a_13_9 = val; return; }
		if (j == 10)	{ a_13_10 = val; return; }
		if (j == 11)	{ a_13_11 = val; return; }
		if (j == 12)	{ a_13_12 = val; return; }
		if (j == 13)	{ a_13_13 = val; return; }
		if (j == 14)	{ a_13_14 = val; return; }
		if (j == 15)	{ a_13_15 = val; return; }
		if (j == 16)	{ a_13_16 = val; return; }
		if (j == 17)	{ a_13_17 = val; return; }
		if (j == 18)	{ a_13_18 = val; return; }
		if (j == 19)	{ a_13_19 = val; return; }
		if (j == 20)	{ a_13_20 = val; return; }
	}
	if (i == 14)
	{
		if (j == 1)	{ a_14_1 = val; return; }
		if (j == 2)	{ a_14_2 = val; return; }
		if (j == 3)	{ a_14_3 = val; return; }
		if (j == 4)	{ a_14_4 = val; return; }
		if (j == 5)	{ a_14_5 = val; return; }
		if (j == 6)	{ a_14_6 = val; return; }
		if (j == 7)	{ a_14_7 = val; return; }
		if (j == 8)	{ a_14_8 = val; return; }
		if (j == 9)	{ a_14_9 = val; return; }
		if (j == 10)	{ a_14_10 = val; return; }
		if (j == 11)	{ a_14_11 = val; return; }
		if (j == 12)	{ a_14_12 = val; return; }
		if (j == 13)	{ a_14_13 = val; return; }
		if (j == 14)	{ a_14_14 = val; return; }
		if (j == 15)	{ a_14_15 = val; return; }
		if (j == 16)	{ a_14_16 = val; return; }
		if (j == 17)	{ a_14_17 = val; return; }
		if (j == 18)	{ a_14_18 = val; return; }
		if (j == 19)	{ a_14_19 = val; return; }
		if (j == 20)	{ a_14_20 = val; return; }
	}
	if (i == 15)
	{
		if (j == 1)	{ a_15_1 = val; return; }
		if (j == 2)	{ a_15_2 = val; return; }
		if (j == 3)	{ a_15_3 = val; return; }
		if (j == 4)	{ a_15_4 = val; return; }
		if (j == 5)	{ a_15_5 = val; return; }
		if (j == 6)	{ a_15_6 = val; return; }
		if (j == 7)	{ a_15_7 = val; return; }
		if (j == 8)	{ a_15_8 = val; return; }
		if (j == 9)	{ a_15_9 = val; return; }
		if (j == 10)	{ a_15_10 = val; return; }
		if (j == 11)	{ a_15_11 = val; return; }
		if (j == 12)	{ a_15_12 = val; return; }
		if (j == 13)	{ a_15_13 = val; return; }
		if (j == 14)	{ a_15_14 = val; return; }
		if (j == 15)	{ a_15_15 = val; return; }
		if (j == 16)	{ a_15_16 = val; return; }
		if (j == 17)	{ a_15_17 = val; return; }
		if (j == 18)	{ a_15_18 = val; return; }
		if (j == 19)	{ a_15_19 = val; return; }
		if (j == 20)	{ a_15_20 = val; return; }
	}
	if (i == 16)
	{
		if (j == 1)	{ a_16_1 = val; return; }
		if (j == 2)	{ a_16_2 = val; return; }
		if (j == 3)	{ a_16_3 = val; return; }
		if (j == 4)	{ a_16_4 = val; return; }
		if (j == 5)	{ a_16_5 = val; return; }
		if (j == 6)	{ a_16_6 = val; return; }
		if (j == 7)	{ a_16_7 = val; return; }
		if (j == 8)	{ a_16_8 = val; return; }
		if (j == 9)	{ a_16_9 = val; return; }
		if (j == 10)	{ a_16_10 = val; return; }
		if (j == 11)	{ a_16_11 = val; return; }
		if (j == 12)	{ a_16_12 = val; return; }
		if (j == 13)	{ a_16_13 = val; return; }
		if (j == 14)	{ a_16_14 = val; return; }
		if (j == 15)	{ a_16_15 = val; return; }
		if (j == 16)	{ a_16_16 = val; return; }
		if (j == 17)	{ a_16_17 = val; return; }
		if (j == 18)	{ a_16_18 = val; return; }
		if (j == 19)	{ a_16_19 = val; return; }
		if (j == 20)	{ a_16_20 = val; return; }
	}
	if (i == 17)
	{
		if (j == 1)	{ a_17_1 = val; return; }
		if (j == 2)	{ a_17_2 = val; return; }
		if (j == 3)	{ a_17_3 = val; return; }
		if (j == 4)	{ a_17_4 = val; return; }
		if (j == 5)	{ a_17_5 = val; return; }
		if (j == 6)	{ a_17_6 = val; return; }
		if (j == 7)	{ a_17_7 = val; return; }
		if (j == 8)	{ a_17_8 = val; return; }
		if (j == 9)	{ a_17_9 = val; return; }
		if (j == 10)	{ a_17_10 = val; return; }
		if (j == 11)	{ a_17_11 = val; return; }
		if (j == 12)	{ a_17_12 = val; return; }
		if (j == 13)	{ a_17_13 = val; return; }
		if (j == 14)	{ a_17_14 = val; return; }
		if (j == 15)	{ a_17_15 = val; return; }
		if (j == 16)	{ a_17_16 = val; return; }
		if (j == 17)	{ a_17_17 = val; return; }
		if (j == 18)	{ a_17_18 = val; return; }
		if (j == 19)	{ a_17_19 = val; return; }
		if (j == 20)	{ a_17_20 = val; return; }
	}
	if (i == 18)
	{
		if (j == 1)	{ a_18_1 = val; return; }
		if (j == 2)	{ a_18_2 = val; return; }
		if (j == 3)	{ a_18_3 = val; return; }
		if (j == 4)	{ a_18_4 = val; return; }
		if (j == 5)	{ a_18_5 = val; return; }
		if (j == 6)	{ a_18_6 = val; return; }
		if (j == 7)	{ a_18_7 = val; return; }
		if (j == 8)	{ a_18_8 = val; return; }
		if (j == 9)	{ a_18_9 = val; return; }
		if (j == 10)	{ a_18_10 = val; return; }
		if (j == 11)	{ a_18_11 = val; return; }
		if (j == 12)	{ a_18_12 = val; return; }
		if (j == 13)	{ a_18_13 = val; return; }
		if (j == 14)	{ a_18_14 = val; return; }
		if (j == 15)	{ a_18_15 = val; return; }
		if (j == 16)	{ a_18_16 = val; return; }
		if (j == 17)	{ a_18_17 = val; return; }
		if (j == 18)	{ a_18_18 = val; return; }
		if (j == 19)	{ a_18_19 = val; return; }
		if (j == 20)	{ a_18_20 = val; return; }
	}
	if (i == 19)
	{
		if (j == 1)	{ a_19_1 = val; return; }
		if (j == 2)	{ a_19_2 = val; return; }
		if (j == 3)	{ a_19_3 = val; return; }
		if (j == 4)	{ a_19_4 = val; return; }
		if (j == 5)	{ a_19_5 = val; return; }
		if (j == 6)	{ a_19_6 = val; return; }
		if (j == 7)	{ a_19_7 = val; return; }
		if (j == 8)	{ a_19_8 = val; return; }
		if (j == 9)	{ a_19_9 = val; return; }
		if (j == 10)	{ a_19_10 = val; return; }
		if (j == 11)	{ a_19_11 = val; return; }
		if (j == 12)	{ a_19_12 = val; return; }
		if (j == 13)	{ a_19_13 = val; return; }
		if (j == 14)	{ a_19_14 = val; return; }
		if (j == 15)	{ a_19_15 = val; return; }
		if (j == 16)	{ a_19_16 = val; return; }
		if (j == 17)	{ a_19_17 = val; return; }
		if (j == 18)	{ a_19_18 = val; return; }
		if (j == 19)	{ a_19_19 = val; return; }
		if (j == 20)	{ a_19_20 = val; return; }
	}
	if (i == 20)
	{
		if (j == 1)	{ a_20_1 = val; return; }
		if (j == 2)	{ a_20_2 = val; return; }
		if (j == 3)	{ a_20_3 = val; return; }
		if (j == 4)	{ a_20_4 = val; return; }
		if (j == 5)	{ a_20_5 = val; return; }
		if (j == 6)	{ a_20_6 = val; return; }
		if (j == 7)	{ a_20_7 = val; return; }
		if (j == 8)	{ a_20_8 = val; return; }
		if (j == 9)	{ a_20_9 = val; return; }
		if (j == 10)	{ a_20_10 = val; return; }
		if (j == 11)	{ a_20_11 = val; return; }
		if (j == 12)	{ a_20_12 = val; return; }
		if (j == 13)	{ a_20_13 = val; return; }
		if (j == 14)	{ a_20_14 = val; return; }
		if (j == 15)	{ a_20_15 = val; return; }
		if (j == 16)	{ a_20_16 = val; return; }
		if (j == 17)	{ a_20_17 = val; return; }
		if (j == 18)	{ a_20_18 = val; return; }
		if (j == 19)	{ a_20_19 = val; return; }
		if (j == 20)	{ a_20_20 = val; return; }
	}

	return;
};

void(float c1, float c2, float c3, float c4, float c5, float c6) p6 =
{
	WriteChar(MSG_ONE, c1);
	WriteChar(MSG_ONE, c2);
	WriteChar(MSG_ONE, c3);
	WriteChar(MSG_ONE, c4);
	WriteChar(MSG_ONE, c5);
	WriteChar(MSG_ONE, c6);
};

float(float num, float dig) pnum =
{
	local float f, i;
	if (num < 0)
	{
		WriteChar(MSG_ONE, 45);
		num = 0 - num;
	}
	f = floor(num / 10);
	num = num - (f * 10);
	if (f)
		dig = pnum(f, dig+1);
	else
	{
		// pad to 6
		for (i = 0; i < (5 - dig); i = i + 1)
			WriteChar(MSG_ONE, 138);
	}
	WriteChar(MSG_ONE, 48 + num);
	return dig;
};

void (string snd) makesound =
{
	stuffcmd(self, "play ");
	stuffcmd(self, snd);
	stuffcmd(self, "\n");

};

float(float start_i, float start_j, float dir_i, float dir_j, float dist) TraceArray =
{
	local float i, check;

	while (i < dist)
	{
		i = i + 1;
		start_i = start_i + dir_i;
		start_j = start_j + dir_j;
		check = array_a(start_i, start_j);
		if ((check == 134) || (check == 135) || (check == 158) || (check == 159))
			return TRUE;
		if ((check == 0) || (check == 2) || (check == 3) || (check == 4) || (check == 6) || (check == 7))
			return FALSE;
	}	
	return FALSE;
};


void(float c) a_WriteChar =
{
	if ((c > 64) && (c < 91))
		c = c + 32;
	WriteChar(MSG_ONE, c);
};

void() Move_Left =
{
	local float check;

	if (self.paq_moved)
		return;
	
	check = array_a(self.paq_i, self.paq_j - 1);
	if ((check == 133) || (check == 138) || (check == 1))
	{
		set_array_a(self.paq_i, self.paq_j, 138);
		self.paq_j = self.paq_j - 1;
		set_array_a(self.paq_i, self.paq_j, 159);
		self.paq_moved = TRUE;
		if (check == 133)
		{
			makesound("eat.wav");
			self.paq_score = self.paq_score + 10;
			self.num_dots = self.num_dots - 1;
		}
		if (check == 1)
		{
			self.paq_pilltime = time + 10;
			makesound("eat.wav");
			self.paq_score = self.paq_score + 100;
		}
	}
};

void() Move_Right =
{
	local float check;

	if (self.paq_moved)
		return;
	
	check = array_a(self.paq_i, self.paq_j + 1);
	if ((check == 133) || (check == 138) || (check == 1))
	{
		set_array_a(self.paq_i, self.paq_j, 138);
		self.paq_j = self.paq_j + 1;
		set_array_a(self.paq_i, self.paq_j, 158);
		self.paq_moved = TRUE;
		if (check == 133)
		{
			makesound("eat.wav");
			self.paq_score = self.paq_score + 10;
			self.num_dots = self.num_dots - 1;
		}
		if (check == 1)
		{
			self.paq_pilltime = time + 10;
			makesound("eat.wav");
			self.paq_score = self.paq_score + 100;
		}
	}
};

void() Move_Up =
{
	local float check;

	if (self.paq_moved)
		return;
	
	check = array_a(self.paq_i - 1, self.paq_j);
	if ((check == 133) || (check == 138) || (check == 1))
	{
		set_array_a(self.paq_i, self.paq_j, 138);
		self.paq_i = self.paq_i - 1;
		set_array_a(self.paq_i, self.paq_j, 134);
		self.paq_moved = TRUE;
		if (check == 133)
		{
			makesound("eat.wav");
			self.paq_score = self.paq_score + 10;
			self.num_dots = self.num_dots - 1;
		}
		if (check == 1)
		{
			self.paq_pilltime = time + 10;
			makesound("eat.wav");
			self.paq_score = self.paq_score + 100;
		}
	}
};

void() Move_Down =
{
	local float check;

	if (self.paq_moved)
		return;
	
	check = array_a(self.paq_i + 1, self.paq_j);
	if ((check == 133) || (check == 138) || (check == 1))
	{
		set_array_a(self.paq_i, self.paq_j, 138);
		self.paq_i= self.paq_i + 1;
		set_array_a(self.paq_i, self.paq_j, 135);
		self.paq_moved = TRUE;
		if (check == 133)
		{
			makesound("eat.wav");
			self.paq_score = self.paq_score + 10;
			self.num_dots = self.num_dots - 1;
		}
		if (check == 1)
		{
			self.paq_pilltime = time + 10;
			makesound("eat.wav");
			self.paq_score = self.paq_score + 100;
		}
	}
};


void(float ghost_i, float ghost_j, float ghost, float ghost_last_i, float ghost_last_j, float ghdead, float ghost_col) Update_Ghost =
{
	local float check1, upok, downok, leftok, rightok, numok, r, c, move_dir;

	check1 = 0;
	upok = 0;
	downok = 0;
	leftok = 0;
	rightok = 0;
	numok = 0;
	r = 0;
	c = 0;
	move_dir = 0;

	if ((ghost == 159) || (ghost == 158) || (ghost == 134) || (ghost == 135))
		ghost = 138;

	set_array_a(ghost_i, ghost_j, ghost);
	
	ghost_dead = ghdead;

	if ((ghost_i == self.paq_i) && (ghost_j == self.paq_j))
	{
		if (!ghdead)
		{
			if (self.paq_pilltime < time)
			{
				makesound("die.wav");
				self.paq_dead = TRUE;
				self.paq_lives = self.paq_lives - 1;
			}
			else
			{
				makesound("ghost.wav");
				self.paq_score = self.paq_score + self.ghost_score;
				self.ghost_score = self.ghost_score * 2;
				ghost_dead = TRUE;
			}
		}
	}	
	numok = 0;

	check1 = array_a(ghost_i, ghost_j - 1);
	if ((check1) && (check1 != 2) && (check1 != 3) && (check1 != 4) && (check1 != 6) && (check1 != 7))
	{
		if ((ghost_last_i == ghost_i) && (ghost_last_j == ghost_j - 1))
			leftok = 2;
		else if ((self.ghost1_i == ghost_i) && (self.ghost1_j == ghost_j - 1))
			leftok = 0;
		else if ((self.ghost2_i == ghost_i) && (self.ghost2_j == ghost_j - 1))
			leftok = 0;
		else if ((self.ghost3_i == ghost_i) && (self.ghost3_j == ghost_j - 1))
			leftok = 0;
		else if ((self.ghost4_i == ghost_i) && (self.ghost4_j == ghost_j - 1))
			leftok = 0;
		else
		{
			leftok = 1;
			numok = numok + 1;
		}
	}
	check1 = array_a(ghost_i, ghost_j + 1);
	if ((check1) && (check1 != 2) && (check1 != 3) && (check1 != 4) && (check1 != 6) && (check1 != 7))
	{
		if ((ghost_last_i == ghost_i) && (ghost_last_j == ghost_j + 1))
			rightok = 2;
		else if ((self.ghost1_i == ghost_i) && (self.ghost1_j == ghost_j + 1))
			rightok = 0;
		else if ((self.ghost2_i == ghost_i) && (self.ghost2_j == ghost_j + 1))
			rightok = 0;
		else if ((self.ghost3_i == ghost_i) && (self.ghost3_j == ghost_j + 1))
			rightok = 0;
		else if ((self.ghost4_i == ghost_i) && (self.ghost4_j == ghost_j + 1))
			rightok = 0;
		else
		{
			rightok = 1;
			numok = numok + 1;
		}
	}
	check1 = array_a(ghost_i - 1, ghost_j);
	if ((check1) && (check1 != 2) && (check1 != 3) && (check1 != 4) && (check1 != 6) && (check1 != 7))
	{
		if ((ghost_last_i == ghost_i - 1) && (ghost_last_j == ghost_j))
			upok = 2;
		else if ((self.ghost1_i == ghost_i - 1) && (self.ghost1_j == ghost_j))
			upok = 0;
		else if ((self.ghost2_i == ghost_i - 1) && (self.ghost2_j == ghost_j))
			upok = 0;
		else if ((self.ghost3_i == ghost_i - 1) && (self.ghost3_j == ghost_j))
			upok = 0;
		else if ((self.ghost4_i == ghost_i - 1) && (self.ghost4_j == ghost_j))
			upok = 0;
		else
		{
			upok = 1;
			numok = numok + 1;
		}
	}
	check1 = array_a(ghost_i + 1, ghost_j);
	if ((check1) && (check1 != 2) && (check1 != 3) && (check1 != 4) && (check1 != 6) && (check1 != 7))
	{
		if ((ghost_last_i == ghost_i + 1) && (ghost_last_j == ghost_j))
			downok = 2;
		else if ((self.ghost1_i == ghost_i + 1) && (self.ghost1_j == ghost_j))
			downok = 0;
		else if ((self.ghost2_i == ghost_i + 1) && (self.ghost2_j == ghost_j))
			downok = 0;
		else if ((self.ghost3_i == ghost_i + 1) && (self.ghost3_j == ghost_j))
			upok = 0;
		else if ((self.ghost4_i == ghost_i + 1) && (self.ghost4_j == ghost_j))
			upok = 0;
		else
		{
			downok = 1;
			numok = numok + 1;
		}
	}

	r = floor(random() * numok);
	
	c = 0;

	if (upok == 1)
	{
		if (c == r)
			move_dir = PAQ_UP;
		c = c + 1;
	}
	if (downok == 1)
	{
		if (c == r)
			move_dir = PAQ_DOWN;
		c = c + 1;
	}
	if (rightok == 1)
	{
		if (c == r)
			move_dir = PAQ_RIGHT;
		c = c + 1;
	}
	if (leftok == 1)
	{
		if (c == r)
			move_dir = PAQ_LEFT;
	}

	if (move_dir == 0)
	{
		if (upok)
			move_dir = PAQ_UP;
		if (downok)
			move_dir = PAQ_DOWN;
		if (rightok)
			move_dir = PAQ_RIGHT;
		if (leftok)
			move_dir = PAQ_LEFT;
	}

	if (!ghdead)
	{
		if (TraceArray(ghost_i, ghost_j, 0, -1, 5))
			move_dir = PAQ_LEFT;
		else if (TraceArray(ghost_i, ghost_j, 0, 1, 5))
			move_dir = PAQ_RIGHT;
		else if (TraceArray(ghost_i, ghost_j, -1, 0, 5))
			move_dir = PAQ_UP;
		else if (TraceArray(ghost_i, ghost_j, 1, 0, 5))
			move_dir = PAQ_DOWN;
	}

	ghost_old_i = ghost_i;
	ghost_old_j = ghost_j;
	ghost_new_i = ghost_i;
	ghost_new_j = ghost_j;
	if (move_dir == PAQ_UP)
		ghost_new_i = ghost_new_i - 1;
	if (move_dir == PAQ_DOWN)
		ghost_new_i = ghost_new_i + 1;
	if (move_dir == PAQ_LEFT)
		ghost_new_j = ghost_new_j - 1;
	if (move_dir == PAQ_RIGHT)
		ghost_new_j = ghost_new_j + 1;
	
	ghost_new = array_a(ghost_new_i, ghost_new_j);

	set_array_a(ghost_new_i, ghost_new_j, ghost_col);

	if ((ghost_new_i == self.paq_i) && (ghost_new_j == self.paq_j))
	{
		if (!ghdead)
		{
			if (self.paq_pilltime < time)
			{
				makesound("die.wav");
				self.paq_dead = TRUE;
				self.paq_lives = self.paq_lives - 1;
			}
			else
			{
				makesound("ghost.wav");
				self.paq_score = self.paq_score + self.ghost_score;
				self.ghost_score = self.ghost_score * 2;
				ghost_dead = TRUE;
			}
		}
	}

};

void()  Update_Paqman =
{
	local float i, j, c, tempx, tempy;
	local entity ent;
	local vector vec;

	self.paqman_frame = time + 0.25;

	if (self.num_dots == 0)
	{

		msg_entity = self;
		WriteChar(MSG_ONE, SVC_CENTERPRINT);
		WriteChar(MSG_ONE, 10);
		WriteChar(MSG_ONE, 10);
		WriteChar(MSG_ONE, 10);
		WriteChar(MSG_ONE, 10);
		WriteChar(MSG_ONE, 10);
		WriteChar(MSG_ONE, 10);
		WriteChar(MSG_ONE, 10);
		WriteChar(MSG_ONE, 10);
		WriteChar(MSG_ONE, 10);
		WriteChar(MSG_ONE, 10);		
		WriteChar(MSG_ONE, 10);		
		WriteChar(MSG_ONE, 10);
		WriteChar(MSG_ONE, 10);		
		p6(' ', ' ', 'C', 'o', 'n', 'g');
		p6('r', 'a', 't', 'u', 'l', 'a');
		p6('t', 'i', 'o', 'n', 's', ' ');
		WriteChar(MSG_ONE, 10);
		WriteChar(MSG_ONE, 10);
		WriteChar(MSG_ONE, 10);		
		WriteChar(MSG_ONE, 10);
		p6('F', 'i', 'n', 'a', 'l', ' ');
		p6('S', 'c', 'o', 'r', 'e', ' ');
		pnum(self.paq_score, 0);
		WriteChar(MSG_ONE, 0);
		
		self.paqman = FALSE;
		self.movetype = MOVETYPE_WALK;
		self.air_finished = time + 12;
		return;
	}

	if (self.paq_dead)
	{
		if (self.paq_lives)
		{
			set_array_a(self.ghost1_i, self.ghost1_j, self.ghost1);
			self.ghost1_i = 10;
			self.ghost1_j = 10;
			self.ghost1 = 138;
			set_array_a(self.ghost1_i, self.ghost1_j, 3);

			set_array_a(self.ghost2_i, self.ghost2_j, self.ghost2);
			self.ghost2_i = 10;
			self.ghost2_j = 11;
			self.ghost2 = 138;
			set_array_a(self.ghost2_i, self.ghost2_j, 4);

			set_array_a(self.ghost3_i, self.ghost3_j, self.ghost3);
			self.ghost3_i = 11;
			self.ghost3_j = 10;
			self.ghost3 = 138;
			set_array_a(self.ghost3_i, self.ghost3_j, 6);

			set_array_a(self.ghost4_i, self.ghost4_j, self.ghost4);
			self.ghost4_i = 11;
			self.ghost4_j = 11;
			self.ghost4 = 138;
			set_array_a(self.ghost4_i, self.ghost4_j, 7);

			set_array_a(self.paq_i, self.paq_j, 138);
			self.paq_i = 2;
			self.paq_j = 4;
			self.paq_dead = FALSE;
			set_array_a(self.paq_i, self.paq_j, 134);
			self.paq_direction = 0;
			makesound("song.wav");
			self.paqman_frame = time + 1;
			self.paq_pilltime = 0;
		}
		else
		{
			msg_entity = self;
			WriteChar(MSG_ONE, SVC_CENTERPRINT);
			WriteChar(MSG_ONE, 10);
			WriteChar(MSG_ONE, 10);
			WriteChar(MSG_ONE, 10);
			WriteChar(MSG_ONE, 10);
			WriteChar(MSG_ONE, 10);
			WriteChar(MSG_ONE, 10);
			WriteChar(MSG_ONE, 10);
			WriteChar(MSG_ONE, 10);
			WriteChar(MSG_ONE, 10);
			WriteChar(MSG_ONE, 10);
			WriteChar(MSG_ONE, 10);
			WriteChar(MSG_ONE, 10);
			WriteChar(MSG_ONE, 10);
			p6(' ', 'G', 'a', 'm', 'e', ' ');
			p6(' ', 'O', 'v', 'e', 'r', ' ');
			WriteChar(MSG_ONE, 10);
			WriteChar(MSG_ONE, 10);
			WriteChar(MSG_ONE, 10);		
			WriteChar(MSG_ONE, 10);		
			p6('F', 'i', 'n', 'a', 'l', ' ');
			p6('S', 'c', 'o', 'r', 'e', ' ');
			pnum(self.paq_score, 0);

			WriteChar(MSG_ONE, 0);
		
			self.paqman = FALSE;
			self.movetype = MOVETYPE_WALK;
			self.air_finished = time + 12;
			return;
		}
	}	
	else
	{
		if (self.paq_direction == PAQ_LEFT)
			Move_Left();
		else if (self.paq_direction == PAQ_RIGHT)
			Move_Right();
		else if (self.paq_direction == PAQ_UP)
			Move_Up();
		else if (self.paq_direction == PAQ_DOWN)
			Move_Down();

		if (self.ghost1_dead)
			Update_Ghost(self.ghost1_i, self.ghost1_j, self.ghost1, self.ghost1_last_i, self.ghost1_last_j, self.ghost1_dead, 34);
		else if (self.paq_pilltime > time)
			Update_Ghost(self.ghost1_i, self.ghost1_j, self.ghost1, self.ghost1_last_i, self.ghost1_last_j, self.ghost1_dead, 8);
		else
			Update_Ghost(self.ghost1_i, self.ghost1_j, self.ghost1, self.ghost1_last_i, self.ghost1_last_j, self.ghost1_dead, 3);
		self.ghost1_i = ghost_new_i;
		self.ghost1_j = ghost_new_j;
		self.ghost1_last_i = ghost_old_i;
		self.ghost1_last_j = ghost_old_j;
		self.ghost1 = ghost_new;
		self.ghost1_dead = ghost_dead;

		if (self.ghost2_dead)
			Update_Ghost(self.ghost2_i, self.ghost2_j, self.ghost2, self.ghost2_last_i, self.ghost2_last_j, self.ghost2_dead, 34);
		else if (self.paq_pilltime > time)
			Update_Ghost(self.ghost2_i, self.ghost2_j, self.ghost2, self.ghost2_last_i, self.ghost2_last_j, self.ghost2_dead, 8);
		else
			Update_Ghost(self.ghost2_i, self.ghost2_j, self.ghost2, self.ghost2_last_i, self.ghost2_last_j, self.ghost2_dead, 4);
		self.ghost2_i = ghost_new_i;
		self.ghost2_j = ghost_new_j;
		self.ghost2_last_i = ghost_old_i;
		self.ghost2_last_j = ghost_old_j;
		self.ghost2 = ghost_new;
		self.ghost2_dead = ghost_dead;

		if (self.ghost3_dead)
			Update_Ghost(self.ghost3_i, self.ghost3_j, self.ghost3, self.ghost3_last_i, self.ghost3_last_j, self.ghost3_dead, 34);
		else if (self.paq_pilltime > time)
			Update_Ghost(self.ghost3_i, self.ghost3_j, self.ghost3, self.ghost3_last_i, self.ghost3_last_j, self.ghost3_dead, 8);
		else
			Update_Ghost(self.ghost3_i, self.ghost3_j, self.ghost3, self.ghost3_last_i, self.ghost3_last_j, self.ghost3_dead, 6);
		self.ghost3_i = ghost_new_i;
		self.ghost3_j = ghost_new_j;
		self.ghost3_last_i = ghost_old_i;
		self.ghost3_last_j = ghost_old_j;
		self.ghost3 = ghost_new;
		self.ghost3_dead = ghost_dead;

		if (self.ghost4_dead)
			Update_Ghost(self.ghost4_i, self.ghost4_j, self.ghost4, self.ghost4_last_i, self.ghost4_last_j, self.ghost4_dead, 34);
		else if (self.paq_pilltime > time)
			Update_Ghost(self.ghost4_i, self.ghost4_j, self.ghost4, self.ghost4_last_i, self.ghost4_last_j, self.ghost4_dead, 8);
		else
			Update_Ghost(self.ghost4_i, self.ghost4_j, self.ghost4, self.ghost4_last_i, self.ghost4_last_j, self.ghost4_dead, 7);
		self.ghost4_i = ghost_new_i;
		self.ghost4_j = ghost_new_j;
		self.ghost4_last_i = ghost_old_i;
		self.ghost4_last_j = ghost_old_j;
		self.ghost4 = ghost_new;
		self.ghost4_dead = ghost_dead;
	}
	if (self.paq_pilltime < time)
	{
		self.ghost_score = 200;
		
		self.ghost1_dead = FALSE;
		self.ghost2_dead = FALSE;
		self.ghost3_dead = FALSE;
		self.ghost4_dead = FALSE;
	}

	msg_entity = self;
	WriteChar(MSG_ONE, SVC_CENTERPRINT);

	WriteChar(MSG_ONE, 10);
	WriteChar(MSG_ONE, 10);
	WriteChar(MSG_ONE, 10);
	WriteChar(MSG_ONE, 10);
	WriteChar(MSG_ONE, 10);
	WriteChar(MSG_ONE, 10);
	WriteChar(MSG_ONE, 10);
	i = 1;						
	j = 1;

	while (i < 21)
	{
		while (j < 21)
		{
			c = array_a(i, j);
			a_WriteChar(c);
			j = j + 1;

		}
		j = 1;
		i = i + 1;

		WriteChar(MSG_ONE, 10);

	}

	WriteChar(MSG_ONE, 10);
	p6('S', 'c', 'o', 'r', 'e', ' ');
	pnum(self.paq_score, 0);
	WriteChar(MSG_ONE, 10);
	p6('L', 'i', 'v', 'e', 's', ' ');

	i = 0;
	j = self.paq_lives;
	if (j == 0)
		j = 1;

	while (i < (7 - j))
	{
		WriteChar(MSG_ONE, 32);
		i = i + 1;
	}
	
	i = 1;

	while(i < self.paq_lives)
	{
		WriteChar(MSG_ONE, 158);
		i = i + 1;
	}

//	WriteChar(MSG_ONE, 10);
//	pnum(self.num_dots, 0);

	WriteChar(MSG_ONE, 0);

	self.paq_moved = FALSE;

	if (self.paq_dead)
		self.paqman_frame = time + 1;

	if (self.num_dots == 0)
	{
		makesound("end.wav");
		self.paqman_frame = time + 1;
		return;
	}
	if (self.impulse == 100)
	{
		self.paqman = FALSE;
		self.movetype = MOVETYPE_WALK;
		self.air_finished = time + 12;
		self.impulse = 0;
		return;
	}
};

void() Toggle_Paqman = 
{
	local float i, j;
	
	if (!self.paqman)
	{
		self.paqman = TRUE;
		self.movetype = MOVETYPE_NOCLIP;
		
		i = 1;
		j = 1;

		while (i < 21)
		{
			while (j < 21)
			{
				set_array_a(i, j, 133);
				j = j + 1;
			}

			j = 1;
			i = i + 1;
		}
		
		set_array_a(2, 2, 1);
		set_array_a(2, 19, 1);
		set_array_a(19, 2, 1);
		set_array_a(19, 19, 1);

		self.ghost1_i = 10;
		self.ghost1_j = 10;
		self.ghost1 = 138;
		set_array_a(self.ghost1_i, self.ghost1_j, 3);

		self.ghost2_i = 10;
		self.ghost2_j = 11;
		self.ghost2 = 138;
		set_array_a(self.ghost2_i, self.ghost2_j, 4);

		self.ghost3_i = 11;
		self.ghost3_j = 10;
		self.ghost3 = 138;
		set_array_a(self.ghost3_i, self.ghost3_j, 6);

		self.ghost4_i = 11;
		self.ghost4_j = 11;
		self.ghost4 = 138;
		set_array_a(self.ghost4_i, self.ghost4_j, 7);



		i = 1;
		j = 1;

		while (i < 21)
		{
			while (j < 21)
			{
				if (i == 1)
					set_array_a(i, j, 2);
				if (j == 1)
					set_array_a(i, j, 2);
				if (i == 20)
					set_array_a(i, j, 2);
				if (j == 20)
					set_array_a(i, j, 2);
				
				if (i == 3)
				{
					if ((j > 2) && ( j < 11))
						set_array_a(i, j, 2);
					if ((j > 11) && ( j < 19))
						set_array_a(i, j, 2);
				}
				if (i == 5)
				{
					if ((j > 4) && ( j < 10))
						set_array_a(i, j, 2);
					if ((j > 10) && ( j < 17))
						set_array_a(i, j, 2);
				}
				if (i == 7)
				{
					if ((j > 6) && ( j < 11))
						set_array_a(i, j, 2);
					if ((j > 11) && ( j < 15))
						set_array_a(i, j, 2);
				}
				if (i == 9)
				{
					if ((j > 8) && ( j < 10))
						set_array_a(i, j, 2);
					if ((j > 10) && ( j < 13))
						set_array_a(i, j, 2);
				}
				if (i == 18)
				{
					if ((j > 2) && ( j < 10))
						set_array_a(i, j, 2);
					if ((j > 10) && ( j < 19))
						set_array_a(i, j, 2);
				}
				if (i == 16)
				{
					if ((j > 4) && ( j < 11))
						set_array_a(i, j, 2);
					if ((j > 11) && ( j < 17))
						set_array_a(i, j, 2);
				}
				if (i == 14)
				{
					if ((j > 6) && ( j < 10))
						set_array_a(i, j, 2);
					if ((j > 10) && ( j < 15))
						set_array_a(i, j, 2);
				}
				if (i == 12)
				{
					if ((j > 8) && ( j < 11))
						set_array_a(i, j, 2);
					if ((j > 11) && ( j < 13))
						set_array_a(i, j, 2);
				}

				if (j == 3)
				{
					if ((i > 2) && ( i < 10))
						set_array_a(i, j, 2);
					if ((i > 10) && ( i < 19))
						set_array_a(i, j, 2);
				}
				if (j == 5)
				{
					if ((i > 4) && ( i < 11))
						set_array_a(i, j, 2);
					if ((i > 11) && ( i < 17))
						set_array_a(i, j, 2);
				}
				if (j == 7)
				{
					if ((i > 6) && ( i < 10))
						set_array_a(i, j, 2);
					if ((i > 10) && ( i < 15))
						set_array_a(i, j, 2);
				}
				if (j == 9)
				{
					if ((i > 8) && ( i < 11))
						set_array_a(i, j, 2);
					if ((i > 11) && ( i < 13))
						set_array_a(i, j, 2);
				}
				if (j == 18)
				{
					if ((i > 2) && ( i < 11))
						set_array_a(i, j, 2);
					if ((i > 11) && ( i < 19))
						set_array_a(i, j, 2);
				}
				if (j == 16)
				{
					if ((i > 4) && ( i < 10))
						set_array_a(i, j, 2);
					if ((i > 10) && ( i < 17))
						set_array_a(i, j, 2);
				}
				if (j == 14)
				{
					if ((i > 6) && ( i < 11))
						set_array_a(i, j, 2);
					if ((i > 11) && ( i < 15))
						set_array_a(i, j, 2);
				}
				if (j == 12)
				{
					if ((i > 8) && ( i < 10))
						set_array_a(i, j, 2);
					if ((i > 10) && ( i < 13))
						set_array_a(i, j, 2);
				}

				
				j = j + 1;
			}

			j = 1;
			i = i + 1;
		}

		self.paq_i = 2;
		self.paq_j = 4;
		self.paq_dead = FALSE;
		set_array_a(self.paq_i, self.paq_j, 134);
		self.paq_direction = 0;
		self.paq_score = 0;
		self.paq_lives = 3;
		self.paq_pilltime = 0;
		self.num_dots = 0;
		makesound("song.wav");
		stuffcmd(self, "cl_bob 0\ncl_rollangle 0\n");

		i = 0;
		j = 0;

		while (i < 21)
		{
			while(j < 21)
			{
				if (array_a(i, j) == 133)
					self.num_dots = self.num_dots + 1;
				j = j + 1;
			}
			j = 0;
			i = i + 1;
		}
	}
	else
	{
		self.paqman = FALSE;
		self.movetype = MOVETYPE_WALK;
		self.air_finished = time + 12;
		return;
	}
	
	self.paqman_frame = time + 0.1;
};

float() Paqman_PreFrame =
{
	if (!self.paqman)
		return FALSE;
	
	self.paq_origin = self.origin;

	if (self.paqman_frame < time)
		Update_Paqman();
	return TRUE;
};


float(float v) frik_anglemod =
{
	return v - floor(v/360) * 360;
};

float (float y1, float y2) angcomp = 
{
	y1 = frik_anglemod(y1);
	y2 = frik_anglemod(y2);

	local float answer;
	answer = y1 - y2;
	if (answer > 180)
		answer = answer - 360;
	else if (answer < -180)
		answer = answer + 360;
	return answer;
};

float() Paqman_PostFrame =
{
	local vector mov;
	local float norm;
	
	if (!self.paqman)
		return FALSE;
	if (self.origin != self.paq_origin)
	{
		mov = vectoangles(self.origin - self.paq_origin);
		self.origin = self.paq_origin;

		norm = angcomp(self.v_angle_y, mov_y);
	
		if (norm > -80 && norm < 80)
			self.paq_direction = PAQ_UP;
		if (norm > 10 && norm < 170)
			self.paq_direction = PAQ_RIGHT;
		if (norm > 100 || norm < -100)
			self.paq_direction = PAQ_DOWN;
		if (norm > -170 && norm < -10)
			self.paq_direction = PAQ_LEFT;
	}

	return TRUE;
};


void() Paqman_Stuff =
{
	if (self.impulse == 100)
		Toggle_Paqman();

};