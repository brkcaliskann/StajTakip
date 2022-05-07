/**
 * @license Copyright (c) 2003-2021, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';

    //config.forcePasteAsPlainText = false;
    //config.pasteFromWordRemoveFontStyles = false;
    //config.pasteFromWordRemoveStyles = false;
    //config.allowedContent = true;
    //config.extraAllowedContent = 'p(mso*,Normal)';
    //config.pasteFilter = null;

    //config.filebrowserImageUploadUrl = "/StajDefteri/Upload";

    /*config.image_previewText = ' ';*/

    //config.language = 'tr';

    /*config.disallowedContent = 'img{width,height};img[width,height]';*/

    //config.language = 'tr';
    //// config.uiColor = '#AADC6E';

    //config.extraPlugins = 'syntaxhighlight';
    //config.toolbar_Full.push(['Code']);


    /*    config.extraPlugins = 'charcount';*/


    config.toolbarGroups = [
        { name: 'clipboard', groups: ['clipboard', 'undo'] },
        { name: 'document', groups: ['document', 'doctools', 'mode'] },
        { name: 'editing', groups: ['selection', 'find', 'spellchecker', 'editing'] },
        { name: 'forms', groups: ['forms'] },
        { name: 'basicstyles', groups: ['basicstyles', 'cleanup'] },
        { name: 'paragraph', groups: ['list', 'indent', 'blocks', 'align', 'bidi', 'paragraph'] },
        { name: 'links', groups: ['links'] },
        { name: 'insert', groups: ['insert'] },
        { name: 'colors', groups: ['colors'] },
        { name: 'tools', groups: ['tools'] },
        { name: 'others', groups: ['others'] },
        { name: 'styles', groups: ['styles'] },
        { name: 'about', groups: ['about'] },
        '/',
        '/'
    ];

    config.removeButtons = 'Source,Save,Templates,Cut,Undo,Find,SelectAll,Scayt,Form,Checkbox,Radio,TextField,Textarea,Select,Button,ImageButton,HiddenField,Subscript,Superscript,CopyFormatting,Outdent,Indent,Blockquote,CreateDiv,Language,BidiRtl,BidiLtr,HorizontalRule,Smiley,Iframe,PageBreak,Maximize,ExportPdf,Preview,Print,PasteFromWord,PasteText,Paste,Copy,Redo,NewPage,ShowBlocks,Replace,RemoveFormat';

    config.resize_enabled = false; // if you can resize
    config.resize_maxHeight = '26.5cm'; // max resize height
    config.resize_maxWidth = 875; // max resize width
    config.resize_minHeight = '26.5cm'; // min resize height
    config.resize_minWidth = 875; // min resize width
    config.width = 875; // starting width
    config.height = '26.5cm'; // starting height
    
    config.syntaxhighlight_lang = 'csharp';
    config.syntaxhighlight_hideControls = true;
    config.languages = 'vi';
    config.filebrowserBrowseUrl = '/ckfinder/ckfinder.html';
    config.filebrowserImageBrowseUrl = '/ckfinder/ckfinder.html?Types=Images';
    config.filebrowserFlashBrowseUrl = '/ckfinder/ckfinder.html?Types=Flash';
    config.filebrowserUploadUrl = '/ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=File';
    config.filebrowserImageUploadUrl = "/StajDefteri/Upload";
    config.filebrowserFlashUploadUrl = '/ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Flash';
    config.extraPlugins = 'wordcount,notification';

    config.wordcount = {

        // Whether or not you Show Remaining Count (if Maximum Word/Char/Paragraphs Count is set)
        showRemaining: false,

        // Whether or not you want to show the Paragraphs Count
        showParagraphs: true,

        // Whether or not you want to show the Word Count
        showWordCount: true,

        // Whether or not you want to show the Char Count
        showCharCount: true,

        // Whether or not you want to Count Bytes as Characters (needed for Multibyte languages such as Korean and Chinese)
        countBytesAsChars: false,

        // Whether or not you want to count Spaces as Chars
        countSpacesAsChars: false,

        // Whether or not to include Html chars in the Char Count
        countHTML: false,

        // Whether or not to include Line Breaks in the Char Count
        countLineBreaks: false,

        // Whether or not to prevent entering new Content when limit is reached.
        hardLimit: true,

        // Whether or not to to Warn only When limit is reached. Otherwise content above the limit will be deleted on paste or entering
        warnOnLimitOnly: false,

        // Maximum allowed Word Count, -1 is default for unlimited
        maxWordCount: -1,

        // Maximum allowed Char Count, -1 is default for unlimited
        maxCharCount: -1,

        // Maximum allowed Paragraphs Count, -1 is default for unlimited
        maxParagraphs: -1,

        // How long to show the 'paste' warning, 0 is default for not auto-closing the notification
        pasteWarningDuration: 0,

        // Add filter to add or remove element before counting (see CKEDITOR.htmlParser.filter), Default value : null (no filter)
        filter: new CKEDITOR.htmlParser.filter({
            elements: {
                div: function (element) {
                    if (element.attributes.class == 'mediaembed') {
                        return false;
                    }
                }
            }
        })
    };

    //config.filebrowserBrowseUrl = 'ckfinder/ckfinder.html';
    //config.filebrowserImageBrowseUrl = 'ckfinder/ckfinder.html?Type=Images';
    //config.filebrowserUploadUrl = 'AppCode/Upload.ashx';
    //config.extraPlugins = 'youtube,syntaxhighlight';

};
