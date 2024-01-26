$fn = 8;
frontleg = [
   [7, -10, 0.8, [4, 2, 0.8]],
   [6.5, -9, 1.5, [4, 2, 1.5]],
   [6.5, -7, 1, [3, 3, 1]],
   [6, -5.3, 3.7, [2, 2.2, 1]],
   [6, -4.5, 14.7, [1.6, 1.5, 1]],
   [6, -5, 17, [2.6, 2.5, 1]],
   [6, -5, 19.7, [1.9, 1.8, 1]],
   [6, -7.5, 30.7, [3, 4, 4]],
   [5, -7.5, 35.7, [4, 8, 4]],
   [5, -7, 40.7, [3, 6, 3.]],
   [3, -3.5, 45.7, [2, 4, 3]]
];
backleg = [
   [7, 10 + 20, 0.8, [4, 2, 0.8]],
   [7, 10 + 21, 1.5, [4, 2, 1.5]],
   [6.5, 10 + 23, 1, [3.5, 3, 1]],
   [4.5, 11 + 24.7, 4.7, [2.5, 2.7, 1]],
   [4, 13 + 23.5, 14.7, [1.6, 1.5, 1]],
   [4, 12 + 25, 19, [2.6, 3.5, 1]],
   [4, 11 + 25, 20.7, [2.9, 2.8, 1]],
   [6, 7 + 22.5, 30.7, [3, 5, 4]],
   [5, 6 + 22.5, 35.7, [4, 8, 4]],
   [4, 6 + 23, 40.7, [4, 8, 3.]],
   [3.5, 6 + 23, 45.7, [4, 7, 4.]],
   [2, 1 + 23.5, 48.7, [3, 8, 4]]
];
face = [
   [5, -30, 56, [0.3, 0.3, 0.7]],
   [3.5, -29.5, 54, [1.5, 1, 1.5]],
   [2, -31, 53, [1, 1, 1]],
   [-1.1, -32.5, 52.4, [2.1, 3, 2.1]],
   [-2.2, -33.5, 53.5, [2, 1, 1.4]],
   [-2, -35.7, 54.1, [2.6, 1, 1]],
   [-0, -38, 53, [1, 1, 1]],
   [-1, -40, 51, [0.5, 0.5, 0.5]],
];
body1 =   [
 
 
[0,33,45,[3,3,3]],
[0,25,45,[4,2,8]],
[0,17,43,[8,2,11]],
[0,11,42,[10,2,13]],
[0,5,42,[11,2,13]],
[0,0,41,[8,5,12]],
[0,-3,39,[8,5,10]], 
[0,-11,38,[7.5,4,9]], 
[0,-15,37,[6,5,6]],
[0,-22,35,[2,2,4]],
[0,-29,40,[3,5,5]],
[0,-31,45,[4,4,4]],
[0,-33,49,[4,2,4]],
[0,-37,50,[3.5,3,3.5]],
[0,-41,51.4,[2.5,1,1.5]],
[0,-43,50.8,[2,2,1]],
[0,-43.4,49.5,[0.5,0.3,0.5]]
];
body2 = [
[0,46,24,[0.2,0.2,0.2]],
[0,43.5,30,[2,2,2]],
[0,41.5,34,[0.8,0.8,0.8]],
[0,37,44,[2,2,2]],
[0,33,46.5,[3,3,3]],
[0,25,48,[2,2,6]],
[0,17,52,[1,2,5]],
[0,11,54.1,[3,2,8]],
[0,5,54,[3,2,8.5]],
[0,0,50,[2,2,8]],
[0,-3,45,[2,2,7.5]], 
[0,-11,44,[3,2,7]], 
[0,-15,39,[4,2,6]],
[0,-22,38,[4,2,6]],
[0,-29,42,[3,5,5]],
[0,-30,51,[3,2,4]],
[0,-35.1,52.4,[4.1,2,3]],
[0,-37,53,[2,2,2]],
[0,-40,54.8,[1,1,1]],
[0,-42,53,[2,3.8,2]],
[0,-42,52,[2.5,4.1,1]]
];
color("BurlyWood") {
   ShowControl(body1);
   ShowControl(frontleg);
   ShowControl(backleg);
   mirror() ShowControl(frontleg);
   mirror() ShowControl(backleg);
   ShowControl(body2);
   ShowControl(face);
   mirror([1, 0, 0]) ShowControl(face);
}
module ShowControl(v) { // translate(t(v[0])) sphere(v[0][3]);
   if (len(v[0][0]) != undef) {
      ShowSplControl(v);
   } else
      for (i = [1: len(v) - 1]) {
         // vg  translate(t(v[i])) sphere(v[i][3]);
         blendline(
            (t(v[i])), (t(v[i - 1])), (v[i][3]), (v[i - 1][3]));
      }
}
module blendline(v1, v2, s1 = 1, s2 = 1) {
   d = 1 / 4;
   for (i = [0 + d: d: 1]) {
      hull() {
         translate(lerp(v1, v2, i)) scale(lerp(s1, s2, SC3(i))) sphere(1);
         translate(lerp(v1, v2, i - d)) scale(lerp(s1, s2, SC3(i - d))) sphere(1);
      }
   }
}

function t(v) = [v[0], v[1], v[2]];

function lerp(start, end, bias) = (end * bias + start * (1 - bias));

function SC3(a) =
let (b = clamp(a))(b * b * (3 - 2 * b));

function clamp(a, b = 0, c = 10) = min(max(a, b), c);

function gauss(i, n = 0) = n > 0 ?
   let (x = gauss(i, n - 1)) x + (x - SC3(x)) : let (x = i) x + (x - SC3(x));
 