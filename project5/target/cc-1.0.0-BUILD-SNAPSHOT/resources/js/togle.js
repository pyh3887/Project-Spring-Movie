

	$(".accordion-row").on("click", function() {
		var accordionRow = $(this).next(".accordion");
		if (!accordionRow.is(":visible")) {
			accordionRow.show().find(".accordion-content").slideDown();
		} else {
			accordionRow.find(".accordion-content").slideUp(function() {
				if (!$(this).is(':visible')) {
					accordionRow.hide();
				}
			});
		}
	});
