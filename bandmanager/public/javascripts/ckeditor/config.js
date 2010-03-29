/*
Copyright (c) 2003-2010, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

CKEDITOR.editorConfig = function( config ) {
  // Define changes to default configuration here. For example:
  config.language = 'pt-BR';
  // config.uiColor = '#AADC6E';
	
  config.toolbar = 'Custom';
  
  config.toolbar_Custom = [
    ['Save','-','Source','Preview','Templates'],
    ['PasteText','PasteFromWord','Print','Scayt'],
    ['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
    ['Bold','Italic','Underline','Strike'],
    '/',
    ['Subscript','Superscript','-','NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
    ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
    ['Link','Unlink','Anchor'],
    ['Image','Flash','Table','HorizontalRule','Smiley','SpecialChar'],
    '/',
    ['Styles','Format','Font','FontSize'],
    ['TextColor','BGColor'],
    ['Maximize', 'ShowBlocks']
  ];

//  config.toolbar_Custom = [
//    ['Source','-','Save','NewPage','Preview','-','Templates'],
//    ['Cut','Copy','Paste','PasteText','PasteFromWord','-','Print', 'SpellChecker', 'Scayt'],
//    ['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
//    ['Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField'],
//    '/',
//    ['Bold','Italic','Underline','Strike','-','Subscript','Superscript'],
//    ['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
//    ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
//    ['Link','Unlink','Anchor'],
//    ['Image','Flash','Table','HorizontalRule','Smiley','SpecialChar','PageBreak'],
//    '/',
//    ['Styles','Format','Font','FontSize'],
//    ['TextColor','BGColor'],
//    ['Maximize', 'ShowBlocks','-','About']
//  ];

};
