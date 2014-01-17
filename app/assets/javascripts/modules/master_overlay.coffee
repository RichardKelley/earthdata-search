$(document).on 'click', '.master-overlay-main li.panel-list-item', ->
  $(this).closest('.master-overlay').toggleClass('is-master-overlay-details-visible')
  return false;

$(document).on 'click', '.master-overlay-show-main', ->
  $(this).closest('.master-overlay').toggleClass('is-master-overlay-details-visible')
  return false;

$(document).on 'click', '.master-overlay-main .master-overlay-close', ->
  $(this).closest('.master-overlay').toggleClass('is-hidden')
  return false;

$(document).on 'click', '.master-overlay-toggle-parent, .master-overlay-parent .master-overlay-close', ->
  $overlay = $(this).closest('.master-overlay')
  $overlay.toggleClass('is-master-overlay-parent-hidden')
  text = if $overlay.hasClass('is-master-overlay-parent-hidden') then 'Show Facets' else 'Hide Facets'
  $overlay.find('.master-overlay-toggle-parent').text(text)
  return false;

$(document).on 'click', '.temporal-dropdown-button', ->
  $(this).parent().toggleClass('open')

$(document).on 'click', '.master-overlay-show', ->
  id = this.href.split('#')[1]
  $('#' + id).removeClass('is-hidden')
  return false;

  $(document).on 'transitionend', '.master-overlay-parent, .master-overlay-main', ->
  console.log 'Overlay animation ended'

$(window).on 'load resize', ->
  # When the window is first loaded or later resized, update the master overlay content
  # boxes to have a height that stretches to the bottom of their parent.  It would
  # be awesome to do this in CSS, but I don't know that it's possible without
  # even uglier results
  $('.master-overlay-content').each ->
    $this = $ this
    $this.height($this.parents('.main-content').height() - $this.offset().top - 40)

# Initialize Expand/Collapse Facets
$(document).ready ->
  $('.collapse').collapse()

# Expand/Collapse Facets
$(document).on 'click', '.collapse-link', ->
  $($(this).find('a').attr("data-target")).collapse('toggle')
  $(this).find('i').toggleClass('fa-caret-down fa-caret-up')