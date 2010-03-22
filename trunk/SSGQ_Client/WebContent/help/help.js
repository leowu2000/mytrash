function startMenu() {

// /�˵�����

	imageDirectory = 'img'; ////ͼƬĿ¼
	menuTree = new obj_collection()

	defineMenuItems(menuTree)

	if (definitionsHaveErrors(menuTree) == false) {createAppearanceArray(menuTree,menuTree.itemWithID('root'));
					       treeVariable = menuTree;
					       expandNode('root');
					    // expandNode('ioffice')
						//expandNode('sysset')
					}

}

// OBJ_NODE - ���������

// ID = ÿ�����ľ��Ա��
// NAME = �˵�����ʾ�Ľ������
// PARENTID = �����ı��
// TYPE = �������ĵ����ļ��л��߸����
// URL = ����Ӧ������
// ALTIMAGE = 16x16 GIF�ļ�(�������ļ���folders)
// POSITION = ����λ��
// TARGET = ��Ҫ��Frame��ʱ��Ϊ�ձ�ʾ�ڵ�ǰҳ��򿪡�
//   _top ��ʾ��ҳ��򿪡�

function obj_node(id,name,parentID,type,url,altImage,position,target) {
	      this.id = id.toLowerCase();
	    this.name = name;
        this.parentID = parentID.toLowerCase();
	    this.type = type.toLowerCase();
	     this.url = url;
	this.altImage = altImage;
	this.position = position;
	  this.target = target;
}

// OBJ_COLLECTION function - defines a new collection

function obj_collection() {
	this.addItem = addItem;
	this.itemWithID = itemWithID;
	this.itemIDExists = itemIDExists;
	this.extractExpandableNodes = extractExpandableNodes;
	this.posOfItemWithID = posOfItemWithID;
	this.length = 0;
	return this
}

// OBJ_ARRAY function - defines a fixed size array

function obj_array(size) {
	this.length = size;
	this.itemWithID = itemWithID;
	this.itemIDExists = itemIDExists;
	this.posOfItemWithID = posOfItemWithID;
	return this
}

// OBJ_NODEAPPEARANCE - defines the appearance of a menu node (using images)

function obj_appearanceNode(id,imageSequence,name,parentID,type,url,target,visable) {
	this.id = id;
	this.imageSequence = imageSequence;
	this.name = name;
	this.parentID = parentID;
	this.type = type;
	this.url = url;
	this.target = target;
	this.visable = visable;	
	return this
}

// createAppearanceArray() function - this function looks at the menu node definitions,
//				      works out how they all fit together, and determines the
//				      image sequence needed to show their position on the menu
//				      tree.  This is then stored in the appearanceArray.

function createAppearanceArray(treeVariable,startNode) {
	appearanceArray = new obj_array(treeVariable.length);
	appearancePos = 1;
	if (startNode.type == 'page') {alert("The createAppearanceArray() function can only be called on a root or folder node.")}
	else {createAppearanceBranch(treeVariable,startNode)}
}

function createAppearanceBranch(treeVariable,startNode) {
	if (startNode.type == 'root') {if (startNode.altImage == '') {var iconImage = 'img-globe.gif'}
				       else {var iconImage = startNode.altImage}
				       var newAppNode = new obj_appearanceNode(startNode.id,iconImage,startNode.name,'',startNode.type,startNode.url,startNode.target,true)
				       appearanceArray[appearancePos] = newAppNode;
				       appearancePos = appearancePos + 1}
	if (startNode.type == 'folder') {var newAppNode = new obj_appearanceNode(startNode.id,'',startNode.name,startNode.parentID,startNode.type,startNode.url,startNode.target,false);
              var appearanceStr = addStringToStart('','img-folder.gif');
	      var lengthOfBranch = extractChildren(treeVariable,treeVariable.itemWithID(startNode.parentID)).length;
	      if (startNode.position == lengthOfBranch) {appearanceStr = addStringToStart(appearanceStr,'img-plus-end.gif|')}
	      else {appearanceStr = addStringToStart(appearanceStr,'img-plus-cont.gif|')}
	      appearanceStr = addStringToStart(appearanceStr,createParentalStructure(treeVariable,startNode.id));
	      newAppNode.imageSequence = appearanceStr;
	      appearanceArray[appearancePos] = newAppNode;
	      appearancePos = appearancePos + 1}
	     

	if (startNode.type == 'page') {var newAppNode = new obj_appearanceNode(startNode.id,'',startNode.name,startNode.parentID,startNode.type,startNode.url,startNode.target,false);
				       if (startNode.altImage == '') {var appearanceStr = 'img-page.gif'}
				       else {var appearanceStr = startNode.altImage}
				       var lengthOfBranch = extractChildren(treeVariable,treeVariable.itemWithID(startNode.parentID)).length;
				       if (startNode.position == lengthOfBranch) {appearanceStr = addStringToStart(appearanceStr,'img-branch-end.gif|')}
				       else {appearanceStr = addStringToStart(appearanceStr,'img-branch-cont.gif|')}
				       appearanceStr = addStringToStart(appearanceStr,createParentalStructure(treeVariable,startNode.id));
					newAppNode.imageSequence = appearanceStr;
	     				 appearanceArray[appearancePos] = newAppNode;
	     				 appearancePos = appearancePos + 1
				       }
	else {
		var nodeChildren = extractAndSortChildren(treeVariable,startNode);
		var lengthOfBranch = nodeChildren.length;
		var currentIndex = 1;
		while (currentIndex <= lengthOfBranch) {createAppearanceBranch(treeVariable,nodeChildren[currentIndex])
							currentIndex = currentIndex + 1}
	     }
}

function collapseNode(nodeID) {

	var startingPos = appearanceArray.posOfItemWithID(nodeID) + 1;
	childCount = 0;
	countChildrenOf(treeVariable,nodeID);
	var endPos = (startingPos + childCount) - 1;
	
	if (endPos < startingPos) {endPos = startingPos + ((extractChildren(treeVariable,treeVariable.itemWithID(nodeID)).length) - 1) }

	currentIndex = startingPos
	while (currentIndex <= endPos) {
		if (appearanceArray[currentIndex].type == 'folder') {if ((appearanceArray[currentIndex].imageSequence).indexOf("img-folder-open.gif") != -1) {collapseAppearance(appearanceArray[currentIndex]); appearanceArray[currentIndex].visable = false}
								     else {appearanceArray[currentIndex].visable = false}
								    }
		else {appearanceArray[currentIndex].visable = false}
		currentIndex = currentIndex + 1
	}

	collapseAppearance(appearanceArray.itemWithID(nodeID))
	timeOutId = setTimeout("drawMenu(appearanceArray)",100);
}

function collapseAppearance(arrayNode) {
	var imageSequence = arrayNode.imageSequence;
	var newImage = "img-plus-cont.gif";
	var oldCont = "img-minus-cont.gif";
	var oldEnd = "img-minus-end.gif";
	var oldLength = oldCont.length;
	var plusPosition = imageSequence.indexOf(oldCont)
	if (plusPosition == -1) {plusPosition = imageSequence.indexOf(oldEnd); newImage = "img-plus-end.gif"; oldLength = oldEnd.length}

	var newAppearance = imageSequence.substring(0,plusPosition) + newImage + "|img-folder.gif"
	arrayNode.imageSequence = newAppearance;
}

// expandNode() function - expands and displays the given node

function expandNode(nodeID) {
	var lengthOfArray = appearanceArray.length;
	var currentIndex = 1;
	while (currentIndex <= lengthOfArray) {
		if ((appearanceArray[currentIndex].id == nodeID) || (appearanceArray[currentIndex].parentID == nodeID)) {appearanceArray[currentIndex].visable = true;
								     
								     if (appearanceArray[currentIndex].id == nodeID) {var parentIndex = currentIndex}
								     }
		currentIndex = currentIndex + 1;
	}
	if (appearanceArray[parentIndex].type != 'root') {
		expandAppearance(appearanceArray[parentIndex])}
	timeOutId = setTimeout("drawMenu(appearanceArray)",100);
}

function expandAppearance(arrayNode) {
	var imageSequence = arrayNode.imageSequence;
	var newImage = "img-minus-cont.gif";
	var oldCont = "img-plus-cont.gif";
	var oldEnd = "img-plus-end.gif";
	var oldLength = oldCont.length;
	var plusPosition = imageSequence.indexOf(oldCont)
	if (plusPosition == -1) {plusPosition = imageSequence.indexOf(oldEnd); newImage = "img-minus-end.gif"; oldLength = oldEnd.length}

	var newAppearance = imageSequence.substring(0,plusPosition) + newImage + "|img-folder-open.gif";
	arrayNode.imageSequence = newAppearance;
}

// drawMenu() ���� - ����explorer��۵Ĳ˵���ʹ��document.write��д��ص�ҳ�棬�Լ��޸ġ�

function drawMenu(appearanceArray) {
	var lengthOfArray = appearanceArray.length;
	var currentIndex = 1;
	var uname;
	top.MenuFrame.document.open("text/html");
	top.MenuFrame.document.write("<HTML><head><link rel='stylesheet' href='css/tree.css'></head><BODY BGCOLOR=#F2F9E8>")
	while (currentIndex <= lengthOfArray) {
		if (appearanceArray[currentIndex].visable == true){drawNode(appearanceArray[currentIndex])}
		currentIndex = currentIndex + 1;
	}
	top.MenuFrame.document.close();
	window.status = '��ӭ��ʹ��ʵʱ������Ϣ�ɼ�ϵͳ!';
}
function getcookieval(offset)
{
	var endstr=document.cookie.indexOf(";",offset)
	if (endstr==-1)
		endstr=document.cookie.length
	return unescape(document.cookie.substring(offset,endstr))
}
function getcookie(name)
{
	var arg=name+"="
	var alen=arg.length
	var clen=document.cookie.length
	var i=0
	while (i<clen)
	{
		var j=i+alen
		if (document.cookie.substring(i,j)==arg)
			return getcookieval(j)
		i=document.cookie.indexOf(" ",i)+1
		if (i==0) 
			break
	}
	return null
}


function drawNode(node) {
	var imageSequence = node.imageSequence;
	writeImageSequence(node,imageSequence);
	top.MenuFrame.document.write("&nbsp;")
	if (node.type == 'root') 
	{
		nodeName = node.name
	}else {
		nodeName = node.name
	}
	
	if (node.target == '') 
	{
		var nodeTarget = 'PageFrame'
	}else {
		nodeTarget = node.target
	}
	
	if (node.type!='folder')
	{
		top.MenuFrame.document.writeln("<A HREF=" + node.url + " TARGET='" + nodeTarget + "'>" + nodeName + "</A><BR>")
	}else{
		
		nodeIdent = "'" + node.id + "'"
		switch (imgstyle)
		{
			case 'close':
				top.MenuFrame.document.writeln("<A HREF=javascript:top.expandNode(" + nodeIdent + ")>" + nodeName +"</A><BR>")
				break
			default:
				top.MenuFrame.document.writeln("<A HREF=javascript:top.collapseNode(" + nodeIdent + ")>" + nodeName +"</A><BR>")
		}
	}
	
}

function writeImageSequence(node,sequence) {
	var finished = false;
	var lengthOfString = sequence.length;
	var imageSeq = sequence;
	
	if (node.target == '') 
	{
		var nodeTarget = 'PageFrame'
	}else {
		nodeTarget = node.target
	}

	while (finished == false) 
	{
		if (imageSeq == '') 
		{
			finished = true
		}else {  
			imageString = stringUpToBar(imageSeq);
			if (imageString.length == imageSeq.length) 
			{
				imageSeq = ''
			}else {
				imageSeq = imageSeq.substring(imageString.length + 1,imageSeq.length);
			}
			switch(imageString)
			{
				case 'img-plus-cont.gif':
					nodeIdent = "'" + node.id + "'"
					top.MenuFrame.document.write("<A HREF=javascript:top.expandNode(" + nodeIdent + ")><IMG SRC='" + imageDirectory + "/" + imageString + "' ALIGN=TEXTTOP BORDER=0></A>")
					break
				case 'img-plus-end.gif':
					nodeIdent = "'" + node.id + "'"
					top.MenuFrame.document.write("<A HREF=javascript:top.expandNode(" + nodeIdent + ")><IMG SRC='" + imageDirectory + "/" + imageString + "' ALIGN=TEXTTOP BORDER=0></A>")
					break
					
				case 'img-folder.gif':
					imgstyle="close"
					nodeIdent = "'" + node.id + "'"
					top.MenuFrame.document.write("<A HREF=javascript:top.expandNode(" + nodeIdent + ")><IMG SRC='" + imageDirectory + "/" + imageString + "' ALIGN=TEXTTOP BORDER=0></A>")
					break

				case 'img-minus-cont.gif':
					
					nodeIdent = "'" + node.id + "'"
					top.MenuFrame.document.write("<A HREF=javascript:top.collapseNode(" + nodeIdent + ")><IMG SRC='" + imageDirectory + "/" + imageString + "' ALIGN=TEXTTOP BORDER=0></A>")
					break
					
				case 'img-minus-end.gif':
					nodeIdent = "'" + node.id + "'"
					top.MenuFrame.document.write("<A HREF=javascript:top.collapseNode(" + nodeIdent + ")><IMG SRC='" + imageDirectory + "/" + imageString + "' ALIGN=TEXTTOP BORDER=0></A>")
					break
					
				case 'img-folder-open.gif':
					imgstyle="open"
					nodeIdent = "'" + node.id + "'"
					top.MenuFrame.document.write("<A HREF=javascript:top.collapseNode(" + nodeIdent + ")><IMG SRC='" + imageDirectory + "/" + imageString + "' ALIGN=TEXTTOP BORDER=0></A>")
					break
					
				case 'img-page.gif':
					nodeIdent = "'" + node.id + "'"
					top.MenuFrame.document.write("<A HREF='" + node.url + "' TARGET='" + nodeTarget + "'><IMG SRC='" + imageDirectory + "/" + imageString + "' ALIGN=TEXTTOP BORDER=0></A>")
					break

				default:
					top.MenuFrame.document.write("<IMG SRC='" + imageDirectory + "/" + imageString + "' ALIGN=TEXTTOP>")
			}
			
		}
	}
}

function stringUpToBar(string) {
	var lengthOfString = string.length;
	var currentIndex = 0;
	var newString = '';
	var finished = false;
	while (finished == false) {
		if (currentIndex == lengthOfString) {finished = true}
		else {
			if (string.charAt(currentIndex) == '|') {finished = true}
			else {newString = newString + string.charAt(currentIndex)}
			currentIndex = currentIndex + 1
		     }
		if (currentIndex == lengthOfString) {finished = true}
	}
	return newString
}

// addStringToStart() function - adds the addition string to the front of the existing string

function addStringToStart(existingString,addition) {
	newString = addition + existingString;
	return newString
}

// createParentalStructure() function - creates a string that shows the parental tree structure

function createParentalStructure(treeVariable,nodeID) {
	var parentAppearance = '';
	var parentID = treeVariable.itemWithID(nodeID).parentID;
	var currentNode = treeVariable.itemWithID(parentID);
	while (parentID != 'root') {
		 var nodePos = currentNode.position;
		 parentID = currentNode.parentID;
		 currentNode = treeVariable.itemWithID(parentID);
		 var lengthOfBranch = extractChildren(treeVariable,currentNode).length;
		 if (nodePos < lengthOfBranch) {parentAppearance = addStringToStart(parentAppearance,'img-vert-line.gif|')}
		 else {parentAppearance = addStringToStart(parentAppearance,'img-blank.gif|')}
	}
	return parentAppearance
}

// extractExpandableNodes() - METHOD of obj_collection - extracts the root and all folder nodes
//							 into a new collection

function extractExpandableNodes() {
	var newCollection = new obj_collection();
	var collectionSize = this.length;
	var currentIndex = 1;
	var currentArray = this;
	while (currentIndex <= collectionSize) {
		if ((currentArray[currentIndex].type == 'folder') || (currentArray[currentIndex].type == 'root')) {
			newCollection = newCollection.addItem(currentArray[currentIndex])
		}
	currentIndex = currentIndex + 1
	}
	return newCollection
}

// ADDITEM function - METHOD of OBJ_COLLECTION - adds an object to the collection

function addItem(object) {
	collectionSize = this.length;
	returnArray = this;
	idExists = returnArray.itemIDExists(object.id)
	if (idExists == false) {returnArray.length = collectionSize + 1;
				returnArray[returnArray.length] = object;
			 	return returnArray}
	else {alert("ERROR: Object with id: " + object.id + " already exists in this collection.")
	      return returnArray}
}
function countChildrenOf(treeVariable,nodeID) {
	var node = treeVariable.itemWithID(nodeID);
	var nodeChildren = extractChildren(treeVariable,node);
	var currentIndex = 1;
	while (currentIndex <= nodeChildren.length) {
		if (nodeChildren[currentIndex].type != 'page') {countChildrenOf(treeVariable,nodeChildren[currentIndex].id)}
		childCount = childCount + 1;
		currentIndex = currentIndex + 1;
	}
}

function posOfItemWithID(id) {
	collectionSize = this.length;
	currentIndex = 1;
	returnIndex = 'undefined';
	while (currentIndex <= collectionSize) {
		if (this[currentIndex].id == id) {returnIndex = currentIndex}
		currentIndex = currentIndex + 1}
	if (returnObject == 'undefined') {alert("ERROR: Object with id: " + id + " not found in this collection.")}
	else {return returnIndex}
}

// ITEMWITHID function - METHOD of OBJ_COLLECTION and OBJ_ARRAY - returns an object with the given ID

function itemWithID(id) {
	collectionSize = this.length;
	currentIndex = 1;
	returnObject = 'undefined';
	while (currentIndex <= collectionSize) {
		if (this[currentIndex].id == id) {returnObject = this[currentIndex]}
		currentIndex = currentIndex + 1}
	if (returnObject == 'undefined') {alert("ERROR: Object with id: " + id + " not found in this collection.")}
	else {return returnObject}
}

// ITEMIDEXISTS function - METHOD of OBJ_COLLECTION and OBJ_ARRAY - checks if an object with the given ID
//						      already exists in the collection

function itemIDExists(id) {
	collectionSize = this.length;
	currentIndex = 1;
	returnStatus = false;
	while (currentIndex <= collectionSize) {
		if ((this[currentIndex].id) == id) {returnStatus = true}
		currentIndex = currentIndex + 1}
	return returnStatus
}

// definitionsHaveErrors function - general function - checks the defined menu infrastructure
//					               for errors.

function definitionsHaveErrors(treeVariable) {
	hasErrors = false
	
	if (checkForMultipleRoots(treeVariable) == true) {hasErrors = true}
	if (checkNodeTypes(treeVariable) == true) {hasErrors = true}
	if (checkForOrphanNodes(treeVariable) == true) {hasErrors = true}
	if (checkForChildren(treeVariable) == true) {hasErrors = true}
	if (checkNodePositions(treeVariable) == true) {hasErrors = true}
	
	return hasErrors
}

// checkNodeTypes function - called from definitionsHaveErrors() function
// - checks for nodes with unknown types

function checkNodeTypes(treeVariable) {
	collectionSize = treeVariable.length;
	var currentIndex = 1;
	var returnStatus = false;
	while (currentIndex <= collectionSize) {
		if ((treeVariable[currentIndex].type != 'root') && (treeVariable[currentIndex].type != 'page') && (treeVariable[currentIndex].type != 'folder')) {
			alert("Node with ID: " + treeVariable[currentIndex].id + " is of an unknown type: " + treeVariable[currentIndex].type + " (not a page, folder or root).")
		}
		currentIndex = currentIndex + 1;
	}
	return returnStatus
}

// checkForMultipleRoots function - called from definitionsHaveErrors() function
// - checks if the menu infrastructure has multiple root nodes
 
function checkForMultipleRoots(treeVariable) {
	collectionSize = treeVariable.length;
	currentIndex = 1;
	rootCount = 0;
	while (currentIndex <= collectionSize) {
		if ((treeVariable[currentIndex].type) == 'root') {rootCount = rootCount + 1}
		currentIndex = currentIndex + 1}
	if (rootCount == 1) {return false}
	else {if (rootCount == 0) {alert("ERROR: You have not defined a root node.")}
	      else {alert("ERROR: You have defined more than one root node.")}
	      return true}
}


// checkForOrphanNodes() function - called from definitionsHaveErrors() function
// - checks if the menu infrastructure contains any nodes without defined parents

function checkForOrphanNodes(treeVariable) {
	collectionSize = treeVariable.length;
	var currentIndex = 1;
	var returnStatus = false;
	while (currentIndex <= collectionSize) {
		if ((treeVariable[currentIndex].type) != 'root') {if (((treeVariable.itemIDExists(treeVariable[currentIndex].parentID)) == false) && (treeVariable[currentIndex].parentID != '')) {returnStatus = true;
																							           alert("ERROR: The parent node: " + treeVariable[currentIndex].parentID + " does not exist for node: " + treeVariable[currentIndex].id + ".")}
								  if (treeVariable[currentIndex].parentID == '') {returnStatus = true;
														  alert("ERROR: Node with ID: " + treeVariable[currentIndex].id + " has no parent, and is not the root node.")}
		           			                 if (treeVariable.itemWithID(treeVariable[currentIndex].parentID).type == 'page') {returnStatus = true; alert("ERROR: Node with ID: " + treeVariable[currentIndex].id + " has a parent (" + treeVariable[currentIndex].parentID + "), but this parent is a page (should be a folder or the root).")}
									}
		currentIndex = currentIndex + 1}
	return returnStatus			           
}

// checkForChildren() function - called from definitionsHaveErrors() function
// - checks that all nodes (except pages) in the menu infrastructure have at least one child

function checkForChildren(treeVariable) {
	collectionSize = treeVariable.length;
	var currentIndex = 1;
	var returnStatus = false;
	while (currentIndex <= collectionSize) {

		if ((treeVariable[currentIndex].type) != 'page') {
			if (checkParentID(treeVariable,treeVariable[currentIndex].id) == false) {returnStatus = true; alert("ERROR: Node with ID: " + treeVariable[currentIndex].id + " is a root node or a folder node (or an node of unknown type) without any defined children.  The root node and any folder nodes MUST have at least one child node.")}
								 }
	
	currentIndex = currentIndex + 1
	}
	return returnStatus
}

// checkParentID() function - checks the given tree for nodes with the given parent ID

function checkParentID(treeVariable,parentCode) {
	collectionSize = treeVariable.length;
	var currentIndex = 1;
	var returnStatus = false;
	while (currentIndex <= collectionSize) {
		if ((treeVariable[currentIndex].parentID) == parentCode) {returnStatus = true}
		currentIndex = currentIndex + 1
	}
	return returnStatus	
}

// checkNodePositions() function - checks the tree infrastructure for node positioning errors

function checkNodePositions(treeVariable) {

	// 1. Make a collection of all folders and the root node
	expandableNodes = treeVariable.extractExpandableNodes()

	// 2. For each node in this collection, make a collection of all the nodes that
        //    are children of that node.

	var currentIndex = 1;
	var collectionSize = expandableNodes.length;
	var returnStatus = false;

	while (currentIndex <= collectionSize) {
		var scanCollection = extractChildren(treeVariable,expandableNodes[currentIndex]);
		
		if (scanPositionErrors(scanCollection,expandableNodes[currentIndex].id) == true) {returnStatus = true}

	currentIndex = currentIndex + 1
	}

	return returnStatus
}


// scanPositionErrors() function - scans the given collection of children for positioning errors

function scanPositionErrors(scanCollection,idOfParent) {

	var returnStatus = false;
	var currentIndex = 1;
	var collectionSize = scanCollection.length;

	// Check for nodes with positions less than 1

	while (currentIndex <= collectionSize) {	
		if (scanCollection[currentIndex].position < 1) {returnStatus = true;
								alert("ERROR: Node with ID: " + scanCollection[currentIndex].id + " with parent: " + scanCollection[currentIndex].parentID + " has a illegal position value (less than 1).")}
		currentIndex = currentIndex + 1
	}
	currentIndex = 1

	while (currentIndex <= collectionSize) {	
		if (scanCollection[currentIndex].position > collectionSize) {returnStatus = true;
								alert("ERROR: Node with ID: " + scanCollection[currentIndex].id + " with parent: " + scanCollection[currentIndex].parentID + " has a illegal position value (greater than branch maximum of " + collectionSize + " positions).")}
		currentIndex = currentIndex + 1
	}
	var loopNo = 1;
	
	while (loopNo <= collectionSize) { 
	
		var currentIndex = 1;
		var positionFound = false;
		while (currentIndex <= collectionSize) {	
			if (scanCollection[currentIndex].position == loopNo) {positionFound = true}
			currentIndex = currentIndex + 1
		}
		if (positionFound == false) {returnStatus = true;  alert("ERROR: There is no node at position " + loopNo + " in branch " + idOfParent + ".  Two or more nodes may have the same position value.")}
		loopNo = loopNo + 1
	}
	currentIndex = 1

	return returnStatus
}

function extractChildren(treeVariable,node) {
	var newCollection = new obj_collection();
	var currentIndex = 1;
	var collectionSize = treeVariable.length;
	nodeID = node.id;

	while (currentIndex <= collectionSize) {
		if ((treeVariable[currentIndex].parentID) == nodeID) {
			newCollection = newCollection.addItem(treeVariable[currentIndex])
		}
		currentIndex = currentIndex + 1
	}
	return newCollection
}

function extractAndSortChildren(treeVariable,node) {
	var childCollection = extractChildren(treeVariable,node);
	var newCollection = new obj_collection();
	var lengthOfCollection = childCollection.length;
	var currentIndex = 1;
	while (currentIndex <= lengthOfCollection) {
		var newNode = extractNodeWithPosition(childCollection,currentIndex)
		newCollection = newCollection.addItem(newNode)
		currentIndex = currentIndex + 1
	}
	return newCollection
}

function extractNodeWithPosition(collection,position) {
	var currentIndex = 1;
	var lengthOfCollection = collection.length;
	while (currentIndex <= lengthOfCollection) {
		if (collection[currentIndex].position == position) {var node = collection[currentIndex]}
		currentIndex = currentIndex + 1
	}
	return node
}

// DEFINEMENUITEMS function - general function - called from start of script to create the menu
//				                 infrastructure.
//
// ����������Ҫ�����ã������menu�����ݣ���ʽ����:  uniqueID,displayName,parentID,typeOfNode,URL,altImage,positionInTree,targetFrame

function defineMenuItems(treeVariable) {
	//root
	treeVariable = treeVariable.addItem(new obj_node('root','���߰���','','root','start.htm','',0,''));

	//ϵͳ��¼

	treeVariable = treeVariable.addItem(new obj_node('1','ϵͳ���','root','folder','','',1,''));
	
	//��½ϵͳ
	treeVariable = treeVariable.addItem(new obj_node('1_1','ϵͳ���','1','page','page/1/1_1.htm','page.gif',1,''));



	treeVariable = treeVariable.addItem(new obj_node('2','���в���','root','folder','','',2,''));

	//���
	treeVariable = treeVariable.addItem(new obj_node('2_1','ϵͳ���в�������','2','page','page/2/2_0.htm','page.gif',1,''));
	

	treeVariable = treeVariable.addItem(new obj_node('3','���ݲɼ�','root','folder','','',3,''));

	treeVariable = treeVariable.addItem(new obj_node('3_1','���','3','page','page/3/3_1.htm','page.gif',1,''));

	treeVariable = treeVariable.addItem(new obj_node('3_2','���̹���','3','page','page/3/3_2.htm','page.gif',2,''));

	treeVariable = treeVariable.addItem(new obj_node('3_3','��������״̬','3','page','page/3/3_3.htm','page.gif',3,''));

	treeVariable = treeVariable.addItem(new obj_node('3_4','��������','3','page','page/3/3_4.htm','page.gif',4,''));


	treeVariable = treeVariable.addItem(new obj_node('4','�������','root','folder','','',4,''));

	treeVariable = treeVariable.addItem(new obj_node('4_1','���','4','page','page/4/4_1.htm','page.gif',1,''));

	treeVariable = treeVariable.addItem(new obj_node('4_2','��Ѵ��','4','page','page/4/4_2.htm','page.gif',2,''));

	treeVariable = treeVariable.addItem(new obj_node('4_3','��Ѵ�ж�','4','page','page/4/4_3.htm','page.gif',3,''));

	treeVariable = treeVariable.addItem(new obj_node('4_4','������Ϣ','4','page','page/4/4_4.htm','page.gif',4,''));

	treeVariable = treeVariable.addItem(new obj_node('4_5','������Ϣ','4','page','page/4/4_5.htm','page.gif',5,''));


	treeVariable = treeVariable.addItem(new obj_node('5','�����ϱ�','root','folder','','',5,''));

	treeVariable = treeVariable.addItem(new obj_node('5_1','�����ϱ�','5','page','page/5/5_1.htm','page.gif',1,''));
	//��ҳ
	treeVariable = treeVariable.addItem(new obj_node('6','����','root','folder','','',6,''));
	//��ҳ
	treeVariable = treeVariable.addItem(new obj_node('6_1','��ҳ','6','page','page/6/6_1.htm','page.gif',1,''));

	//����
	treeVariable = treeVariable.addItem(new obj_node('6_2','����','6','page','page/6/6_2.htm','page.gif',2,''));

}
