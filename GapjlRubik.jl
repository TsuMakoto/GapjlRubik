using GAP

U = @gap ( 1, 3, 8, 6) * ( 2, 5, 7, 4) * ( 9,33,25,17) * (10,34,26,18) * (11,35,27,19);
L = @gap ( 9,11,16,14) * (10,13,15,12) * ( 1,17,41,40) * ( 4,20,44,37) * ( 6,22,46,35);
F = @gap (17,19,24,22) * (18,21,23,20) * ( 6,25,43,16) * ( 7,28,42,13) * ( 8,30,41,11);
R = @gap (25,27,32,30) * (26,29,31,28) * ( 3,38,43,19) * ( 5,36,45,21) * ( 8,33,48,24);
B = @gap (33,35,40,38) * (34,37,39,36) * ( 3, 9,46,32) * ( 2,12,47,29) * ( 1,14,48,27);
D = @gap (41,43,48,46) * (42,45,47,44) * (14,22,30,38) * (15,23,31,39) * (16,24,32,40);

# 群cubeをu,l,f,r,b,dから生成
cube = (@gap Group)(U,L,F,R,B,D)
# 語のための生成元を定義
words = @gap ["U", "L", "F", "R", "B", "D"]

free = (@gap FreeGroup)(words) # 自由群を生成
gen = (@gap GeneratorsOfGroup)(cube) # cubeの生成元をリストで保存
hom = (@gap GroupHomomorphismByImages)(free, cube, (@gap GeneratorsOfGroup)(free), gen) # 準同型を作成
WordElements(state) = (@gap PreImagesRepresentative)(hom, state)