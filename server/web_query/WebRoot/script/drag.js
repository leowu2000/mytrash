// This code allows any absolutely positioned element
         // with the custom attribute dragEnabled to be dragged.
         var elDragged = null  // Element to drag.

         function doMouseMove() {
            // Check whether mouse button is down and whether
            // an element is being dragged.
            if ((1 == event.button) && (elDragged != null)) {
               // Move the element.
               // Save mouse's position in the document
               var intTop = event.clientY + document.body.scrollTop;
               var intLeft = event.clientX + document.body.scrollLeft;
               // Determine what element the mouse is really over.
               var intLessTop  = 0;
               var intLessLeft = 0;
               var elCurrent = elDragged.offsetParent;
               while (elCurrent.offsetParent != null) {
                  intLessTop += elCurrent.offsetTop;
                  intLessLeft += elCurrent.offsetLeft;
                  elCurrent = elCurrent.offsetParent;
               }
               // Set new position.
               elDragged.style.pixelTop =
                  intTop  - intLessTop - elDragged.y;
               elDragged.style.pixelLeft =
                  intLeft - intLessLeft  - elDragged.x;
               event.returnValue = false;
            }
         }

         function checkDrag(elCheck) {
            // Check whether the mouse is over an element
            // that supports dragging.
            while (elCheck != null) {
               if (null != elCheck.getAttribute("dragEnabled")) 
                  return elCheck;
               elCheck = elCheck.parentElement;
            }      
            return null;
         }

         function doMouseDown() {
            // Store element to be dragged.
            var elCurrent = checkDrag(event.srcElement);
            if (null != elCurrent) {
               elDragged = elCurrent;
               // Determine where the mouse is in the element.
               elDragged.x = event.offsetX;
               elDragged.y = event.offsetY;
               var op = event.srcElement;
               // Find real location with respect to element being
               // dragged.
               if ((elDragged != op.offsetParent) &&
                     (elDragged != event.srcElement)) {
                  while (op != elDragged) {
                     elDragged.x += op.offsetLeft;
                     elDragged.y += op.offsetTop;
                     op = op.offsetParent;
                  }
               }
            }
         }

         function doSelectTest() {
            // Don't start text selections in dragged elements.
            return (null == checkDrag(event.srcElement) &&
               (elDragged!=null));
         }

         // Hook up mouse event handlers.
         document.onmousedown = doMouseDown;
         document.onmousemove = doMouseMove;
         // Reset element when mouse button is released.
         document.onmouseup = new Function("elDragged = null;");
         document.ondragstart = doSelectTest;
         document.onselectstart = doSelectTest;