function openReciept(event) {
			var popupWidth = 900;
            var popupHeight = 720;
			var screenWidth = window.screen.width;
            var screenHeight = window.screen.height;
			var left = (screenWidth - popupWidth)/2;
            var top = (screenHeight - popupHeight)/2 -100;
			
			var button = event.target;
    		var tr = button.closest('tr');
    
   			var no = tr.cells[0].innerText;
			
    		var popupUrl='/refundReceipt.do'

    		console.log(popupUrl+"?no=" +no);
            window.open(popupUrl+"?no=" +no, "refundReceipt", `width=${popupWidth},height=${popupHeight},left=${left},top=${top},resizable=yes,scrollbars=yes`);
            console.log('open');
}

function openDetail(event) {
			var popupWidth = 500;
            var popupHeight = 600;
			var screenWidth = window.screen.width;
            var screenHeight = window.screen.height;
			var left = (screenWidth - popupWidth)/2;
            var top = (screenHeight - popupHeight)/2 -100;
			
			var button = event.target;
    		var tr = button.closest('tr');
    
   			var no = tr.cells[0].innerText;
			
    		var popupUrl='/refundDetailPopup.do'

    		console.log(popupUrl+"?no=" +no);
            window.open(popupUrl+"?no=" +no, "refundDetailPopup", `width=${popupWidth},height=${popupHeight},left=${left},top=${top},resizable=yes,scrollbars=yes`);
            console.log('open');
}