function toggleSearchWord() {
            var searchType = document.getElementsByName("searchType")[0];
            var searchWord = document.getElementsByName("searchWord")[0];
            if (searchType.value === "all") {
                searchWord.disabled = true;
                searchWord.value = "전체검색을 선택하셨습니다"; // 입력 필드를 비웁니다.
            } else {
                searchWord.disabled = false;
                searchWord.value = ""; 
            }
        }

        window.onload = function() {
            // 페이지 로드 시 초기 상태 설정
            toggleSearchWord();
            // select 요소의 변경 이벤트에 toggleSearchWord 함수를 연결
            document.getElementsByName("searchType")[0].addEventListener("change", toggleSearchWord);
        }
       