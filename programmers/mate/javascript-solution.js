// 정답률 63.2%
function solution(X, Y) {
    var answer = '';
    
    var arrX = X.split('');
    var arrY = Y.split('');
    var xTestMates = arrX.filter((x) => arrY.includes(x));
    var yTestMates = arrY.filter((y) => arrX.includes(y));
    
    if (xTestMates.length == 0 || yTestMates.length == 0) {
        answer = "-1";
        return answer;
    }
    if (xTestMates[0] == "0") {
        answer = "0";
        return answer;
    }
    
    var mates = (xTestMates.length > yTestMates.length) ? yTestMates : xTestMates;
    mates = mates.sort((a, b) => b - a);
    
    answer = (mates.toString()).replace(/[\D]/gi, "");
    
    return answer;
}

// 정답률 100%
function solution(X, Y) {
    var answer = '';
    
    var num = [
        {"0": [0,0]},
        {"1": [0,0]},
        {"2": [0,0]},
        {"3": [0,0]},
        {"4": [0,0]},
        {"5": [0,0]},
        {"6": [0,0]},
        {"7": [0,0]},
        {"8": [0,0]},
        {"9": [0,0]},
    ];
    var arrMate = [];
    var mate = '';
    
    var arrX = X.split('');
    var arrY = Y.split('');
    arrX.forEach((x) => {
        num[x][x][0]++;
    });
    arrY.forEach((y) => {
        num[y][y][1]++;
    });
    
    num.forEach((numberItem, index) => {
        var cntX = num[index][index][0];
        var cntY = num[index][index][1];
        
        if (cntX != 0 && cntY != 0) {
            var cnt = (cntX > cntY) ? cntY : cntX;
            for(var i = 0; i<cnt; i++) {
                arrMate.push(Object.keys(numberItem)[0]);
            }
        }
    });
    
    if (arrMate.length == 0) {
        mate = "-1";
    } else {
        arrMate.sort((a, b) => b - a);
        
        if (arrMate[0] == "0") {
            mate = "0";
        } else {
            mate = arrMate.toString();
            mate = mate.replace(/[\D]/gi, "");
        }
    }

    answer = mate;

    return answer;
}

