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
