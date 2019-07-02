var nichesChemicalController = Paloma.controller('Niches/Chemicals');
var nichesManufacturingController = Paloma.controller('Niches/Manufacturings');
var adminWorkItemsController = Paloma.controller('Admin/WorkItems')

var StatusMonitor = {
  workItemId: null,
  status: null,

  getStatusResponse: function() {
    if (this.status === 'incomplete') {
      return { word: 'complete', data: true };
    }

    return { word: 'incomplete', data: false };
  },

  submitHandler: function(e) {
    e.preventDefault();

    var response = this.getStatusResponse();

    if (window.confirm("Are you sure you want to mark this item as " + response.word + "?")) {
      request = $.ajax({
        type: "PUT",
        url: '/work_items/' + this.workItemId,
        data: { complete: response.data },
      })

      .done(function(json, code) {
      })

      .fail(function(xhr, code) {;
        console.log(xhr);
        console.log(code);
      });
    }
  },

  init: function() {
    this.workItemId =  $('.submit').attr('data-id');
    this.status = $('.submit').attr('data-status');
    $('.submit').on('click', 'a', this.submitHandler.bind(this));
  },
}

var CheckTracker = {
  storageHash: null,
  $checkboxes: null,

  changeHandler: function(e) {
    var input = e.target;
    var id = $(input).attr('data-id');

    this.storageHash[id] = input.checked;
    localStorage['checkboxValues'] = JSON.stringify(this.storageHash);  
  },

  init: function() {
    var self = this;
    this.storageHash = (JSON.parse(localStorage.getItem('checkboxValues')) || {});
    this.$checkboxes = $('.container').find(':checkbox');
    $('.container').on('change', ':checkbox', this.changeHandler.bind(this));
    
    this.$checkboxes.each(function(idx, checkbox) {
      var id = $(checkbox).attr('data-id');
      $(checkbox).attr('checked', self.storageHash[id]); 
    });
  },
};

nichesChemicalController.prototype.index = function() {
  StatusMonitor.init(); 
  CheckTracker.init();
};

nichesManufacturingController.prototype.index = function() {
  StatusMonitor.init(); 
  CheckTracker.init();
};

adminWorkItemsController.prototype.show = function() {
  StatusMonitor.init(); 
  CheckTracker.init();
};
