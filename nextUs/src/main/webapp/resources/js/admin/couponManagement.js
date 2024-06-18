function openPopup(event) {
			var popupWidth = 500;
            var popupHeight = 800;
			var screenWidth = window.screen.width;
            var screenHeight = window.screen.height;
			var left = (screenWidth - popupWidth)/2;
            var top = (screenHeight - popupHeight)/2 -100;
			
			var button = event.target;
    		var tr = button.closest('tr');
    
   			var data = tr.cells[1].innerText;
			console.log(data);
			
    		var popupUrl='/couponMemberPopup.do'

    		console.log(popupUrl+"?data=" +data);
            window.open(popupUrl+"?data=" +data, "couponMember", `width=${popupWidth},height=${popupHeight},left=${left},top=${top},resizable=yes,scrollbars=yes`);
            console.log('open');
}