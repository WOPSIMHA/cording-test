import java.util.*;

class Solution {
    public int solution(int[] cards) {
        int answer = 0;

        boolean[] visited = new boolean[cards.length];
        List<Integer> resultList = new ArrayList<Integer>();
        
        for(int i=0; i<cards.length; i++)
            {
                int result = visitedCheck(cards[i] - 1, 0, cards, visited, resultList);
            }
        resultList.sort((a,b) -> b - a);
        answer = resultList.get(0) * resultList.get(1);
        
        return answer;
    }
    public static int visitedCheck (
         int cardValue, 
         int count, 
         int[] cards, 
         boolean[] visited, 
         List<Integer> resultList
     ) {
        if(visited[cardValue]) {
            resultList.add(Integer.valueOf(count));
            return count;
        } else {
            count++;
            visited[cardValue] = true;
        }
        return visitedCheck(cards[cardValue] - 1, count, cards, visited, resultList);
    }
}
