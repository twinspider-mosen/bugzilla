// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import 'dom-utils/getParentNode';
import 'dom-utils/getOffsetParent';
import 'dom-utils/getDocumentRect';
import 'dom-utils/getViewportRect';
import 'utils/getMainAxisFromPlacement';
import 'utils/getOppositePlacement';
import 'utils/getOppositeVariationPlacement';
import "controllers"
import "bootstrap"


// $(document).ready(function(){
//   var counter = 0;

//   $('.project-select-input').on('click', function(){
//     if ($(this).prop('checked')) {
//       counter += 1;
//       $('#delete-projects').css('display', 'block');
//     } else {
//       counter -= 1;
//       if (counter <= 0) {
//         $('#delete-projects').css('display', 'none');
//       }
//     }
//   });
// });
