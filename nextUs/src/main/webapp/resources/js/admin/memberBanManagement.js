function openPopup(pageName) {
			var popupWidth = 1050;
            var popupHeight = 800;
			var screenWidth = window.screen.width;
            var screenHeight = window.screen.height;
			var left = (screenWidth - popupWidth)/2;
            var top = (screenHeight - popupHeight)/2 -100;
			
			var url = "/addBanPopup"+pageName+".do";
            window.open(url, "addBan", `width=${popupWidth},height=${popupHeight},left=${left},top=${top},resizable=yes,scrollbars=yes`);
            console.log('open');
}