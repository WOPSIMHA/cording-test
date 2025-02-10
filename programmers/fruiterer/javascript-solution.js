function solution(k, m, score) {
    var answer = 0;
    
    var scoreLen = score.length;
    var dustLen = scoreLen % m;
    var fitLen = scoreLen - dustLen;
    var scoreSum = 0;

    var scoredesc = score.sort((a, b) => b - a);
    if(dustLen != 0) {
        scoredesc = scoredesc.slice(0, dustLen*-1)
    }
    for (var i=0; i<fitLen; i+=m) {
        if(scoredesc[i] == scoredesc[i+m-1]) {
            scoreSum = scoreSum + scoredesc[i]*m;
        } else {
            scoreSum = scoreSum + scoredesc[i+m-1]*m;
        }
    }
    answer = scoreSum;
    return answer;
}
