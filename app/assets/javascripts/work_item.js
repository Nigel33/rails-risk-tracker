workItemSelector = {
	selectingWorkItemHandler: function(e) {
		e.preventDefault();
		e.stopPropagation();

		var id =  $(e.currentTarget).attr("data-work_item");
		var niche = $(e.currentTarget).attr('data-niche') + 's';

		$(location).attr('href', '/work_items/' + id + '/niches/' + niche  )
	},

	showCompanyHandler: function(e) {
		e.preventDefault();
		e.stopPropagation();

		var id = $(e.currentTarget).attr('data-id');
		
		$.ajax({
			type: 'GET',
			url: '/companies/' + id,
			dataType: 'json',
			data: {
				id: id,
			},
		})

		.done(function(json, code) {
			var template = HandlebarsTemplates["company"]({company: json});
			$('.modal_container').html(template);
			$('.modal_container').fadeIn(400);
		})

		.fail(function(xhr, code) {
			console.log(code);
		});
	},

	showReportHandler: function(e) {
		e.stopPropagation();
	},

	removeModalHandler: function(e) {
		e.preventDefault();

		$('.modal_container').fadeOut(400, function() {

			$(this).empty();
		});
	},

	init: function() {
		$(".table").on('click', '.work_item', this.selectingWorkItemHandler.bind(this));
		$(".table").on('click', '.report', this.showReportHandler.bind(this));
		$(".table").on('click', '.company', this.showCompanyHandler.bind(this));
		$(".modal_container").on('click', '.modal_layer', this.removeModalHandler.bind(this));
	},
};

var UsersController = Paloma.controller('Users');


UsersController.prototype.display_items = function() {
	workItemSelector.init();
};

UsersController.prototype.display_completed_items = function() {
	workItemSelector.init();
};
