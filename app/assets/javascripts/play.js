$( document ).on('ready page:load', function() {
  $(".vote input[type=radio]").on("click", function() {
    $("#maintitle").text($(this).data("tt"));
  });

  if (duoPicks) {
    $('#pp_toggle').show();
    ppSaveOriginalState();
  } else {
    $('#pp_toggle').hide();
  };

  $('#pp_false').on('click', function() {
    ppRestoreOriginalState();
  });

  $('#pp_true').on('click', function() {
    ppSaveOriginalState();

    $('.vote input[type=radio]').each(function() {
      var gameId = $(this).data('game');
      $(this).prop('disabled', true).prop('checked', $(this).val() == duoPicks[gameId]);
    });

    $('#tiebreaker input[type=number]').each(function() {
      var gameId = $(this).data('game');
      var score  = $(this).data('score');
      $(this).prop('disabled', true).val(duoPicks[gameId][score]);
    });
  });
});

function ppSaveOriginalState() {
  $('.vote input[type=radio]').each(function() {
    $(this).data('original-state',    $(this).prop('checked'));
    $(this).data('original-disabled', $(this).prop('disabled'));
  });

  $('#tiebreaker input[type=number]').each(function() {
    $(this).data('original-value',    $(this).val());
    $(this).data('original-disabled', $(this).prop('disabled'));
  });
}

function ppRestoreOriginalState() {
  $('.vote input[type=radio]').each(function() {
    $(this).prop('checked',  $(this).data('original-state'));
    $(this).prop('disabled', $(this).data('original-disabled'));
  });

  $('#tiebreaker input[type=number]').each(function() {
    $(this).val($(this).data('original-value'));
    $(this).prop('disabled', $(this).data('original-disabled'));
  });
}
