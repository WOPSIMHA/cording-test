function solution(cards) {
    var answer = 0;
    var visited = new Array(cards.length);
    var result = [];
    
    function visitedCheck (cardValue, count) {
        if (visited[cardValue] == true) {
            result.push(count);
            return count;
        } else {
            count++;
            visited[cardValue] = true;
        }
      return visitedCheck(cards[cardValue] - 1, count);
    }
    
    cards.forEach((value, index) => {
        visitedCheck(value - 1, 0);
    });

    result = result.sort((a,b) => b - a);
    answer = result[0] * result[1];
  
    return answer;
}
