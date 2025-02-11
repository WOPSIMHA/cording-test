// v 2차원 배열 [ [],[],[] ]
function solution(v) {
    var answer = [];

    var xy = [];
    if (v[0][0] == v[1][0]) {
      xy.push(v[2][0]);
    } else if (v[0][0] == v[2][0]) {
      xy.push(v[1][0]);
    } else if (v[1][0] == v[2][0]) {
      xy.push(v[0][0]);
    }
    
    if (v[0][1] == v[1][1]) {
      xy.push(v[2][1]);
    } else if (v[0][1] == v[2][1]) {
      xy.push(v[1][1]);
    } else if (v[1][1] == v[2][1]) {
      xy.push(v[0][1]);
    }

    answer = xy;

    return answer;
}

// 비트연산자 이용
function solution(v) {
    var answer = [];

    var xy = [];
    xy.push(v[0][0]^v[1][0]^v[2][0]);
    xy.push(v[0][1]^v[1][1]^v[2][1]);

    answer = xy;

    return answer;
}
