/**
 * @license Copyright (c) 2003-2022, CKSource Holding sp. z o.o. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function( config ) {
	
	config.allowedContent = true;
	config.youtube_width = '640';
	config.youtube_responsive = true;
	config.youtube_related = true;
	config.youtube_older = false;
	config.youtube_privacy = false;
	config.youtube_controls = true;
	config.filebrowserUploadUrl      = '/uploadFiles?type=Files',
	config.filebrowserImageUploadUrl = '/uploadImage?type=Images',
	config.filebrowserUploadMethod='form'; //파일 오류났을때 alert띄워줌

	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
};




