{* TestLink Open Source Project - http://testlink.sourceforge.net/ *}
{* $Id: attachmentupload.tpl,v 1.6 2007/02/23 07:52:43 franciscom Exp $ *}
{* Purpose: smarty template - the template for the attachment upload dialog *}
{include file="inc_head.tpl"}

<body onunload="attachmentDlg_onUnload()" onload="attachmentDlg_onLoad()">
{config_load file="input_dimensions.conf" section="attachmentupload"} {* Constant definitions *}

<h1>{lang_get s='title_upload_attachment'}</h1>
{if $bUploaded == 1}
	<div class='info'>{lang_get s='import_was_ok'}</div>
{/if}

<div class="workBack">
	<h2>{lang_get s='title_choose_local_file'}</h2>
	
	<form action="lib/attachments/attachmentupload.php" method="post" enctype="multipart/form-data">
		<input type="hidden" name="MAX_FILE_SIZE" value="{$import_limit}" /> {* restrict file size *}
		<p>{lang_get s='local_file'}
			<input type='hidden' value='{$id}' name='id' />
			<input type='hidden' value='{$tableName}' name='tableName' />
			<input type="file" name="uploadedFile" size="{#UPLOAD_FILENAME_SIZE#}" />
		</p>
		<p>
			{lang_get s='enter_attachment_title'}:
			<input type='text' name='title' maxlength="{#ATTACHMENT_TITLE_MAXLEN#}" 
			                                size="{#ATTACHMENT_TITLE_SIZE#}" />
		</p>
		<div class="groupBtn">
			<input type="submit" value="{lang_get s='btn_upload_file'}" onclick="return attachmentDlg_onSubmit()" />
			<input type="button" value="{lang_get s='btn_cancel'}" onclick="window.close()" />
		</div>
	</form>
	<p>
		{lang_get s='max_size_cvs_file'}: {$import_limit} Bytes
	</p>
</div>

</body>
</html>