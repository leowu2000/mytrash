﻿/*
 * FCKeditor - The text editor for Internet - http://www.fckeditor.net
 * Copyright (C) 2003-2007 Frederico Caldeira Knabben
 *
 * == BEGIN LICENSE ==
 *
 * Licensed under the terms of any of the following licenses at your
 * choice:
 *
 *  - GNU General Public License Version 2 or later (the "GPL")
 *    http://www.gnu.org/licenses/gpl.html
 *
 *  - GNU Lesser General Public License Version 2.1 or later (the "LGPL")
 *    http://www.gnu.org/licenses/lgpl.html
 *
 *  - Mozilla Public License Version 1.1 or later (the "MPL")
 *    http://www.mozilla.org/MPL/MPL-1.1.html
 *
 * == END LICENSE ==
 *
 * Chinese Traditional language file.
 */

var FCKLang =
{
// Language direction : "ltr" (left to right) or "rtl" (right to left).
Dir					: "ltr",

ToolbarCollapse		: "隐藏面板",
ToolbarExpand		: "显示面板",

// Toolbar Items and Context Menu
Save				: "储存",
NewPage				: "开新档案",
Preview				: "预览",
Cut					: "剪下",
Copy				: "复制",
Paste				: "贴上",
PasteText			: "贴为纯文字格式",
PasteWord			: "自 Word 贴上",
Print				: "列印",
SelectAll			: "全选",
RemoveFormat		: "清除格式",
InsertLinkLbl		: "超连结",
InsertLink			: "插入/编辑超连结",
RemoveLink			: "移除超连结",
Anchor				: "插入/编辑锚点",
InsertImageLbl		: "影像",
InsertImage			: "插入/编辑影像",
InsertFlashLbl		: "Flash",
InsertFlash			: "插入/编辑 Flash",
InsertTableLbl		: "表格",
InsertTable			: "插入/编辑表格",
InsertLineLbl		: "水平线",
InsertLine			: "插入水平线",
InsertSpecialCharLbl: "特殊符号",
InsertSpecialChar	: "插入特殊符号",
InsertSmileyLbl		: "表情符号",
InsertSmiley		: "插入表情符号",
About				: "关於 FCKeditor",
Bold				: "粗体",
Italic				: "斜体",
Underline			: "底线",
StrikeThrough		: "删除线",
Subscript			: "下标",
Superscript			: "上标",
LeftJustify			: "靠左对齐",
CenterJustify		: "置中",
RightJustify		: "靠右对齐",
BlockJustify		: "左右对齐",
DecreaseIndent		: "减少缩排",
IncreaseIndent		: "增加缩排",
Undo				: "复原",
Redo				: "重复",
NumberedListLbl		: "编号清单",
NumberedList		: "插入/移除编号清单",
BulletedListLbl		: "项目清单",
BulletedList		: "插入/移除项目清单",
ShowTableBorders	: "显示表格边框",
ShowDetails			: "显示详细资料",
Style				: "样式",
FontFormat			: "格式",
Font				: "字体",
FontSize			: "大小",
TextColor			: "文字颜色",
BGColor				: "背景颜色",
Source				: "原始码",
Find				: "寻找",
Replace				: "取代",
SpellCheck			: "拼字检查",
UniversalKeyboard	: "万国键盘",
PageBreakLbl		: "分页符号",
PageBreak			: "插入分页符号",

Form			: "表单",
Checkbox		: "核取方块",
RadioButton		: "选项按钮",
TextField		: "文字方块",
Textarea		: "文字区域",
HiddenField		: "隐藏栏位",
Button			: "按钮",
SelectionField	: "清单/选单",
ImageButton		: "影像按钮",

FitWindow		: "编辑器最大化",

// Context Menu
EditLink			: "编辑超连结",
CellCM				: "储存格",
RowCM				: "列",
ColumnCM			: "栏",
InsertRow			: "插入列",
DeleteRows			: "删除列",
InsertColumn		: "插入栏",
DeleteColumns		: "删除栏",
InsertCell			: "插入储存格",
DeleteCells			: "删除储存格",
MergeCells			: "合并储存格",
SplitCell			: "分割储存格",
TableDelete			: "删除表格",
CellProperties		: "储存格属性",
TableProperties		: "表格属性",
ImageProperties		: "影像属性",
FlashProperties		: "Flash 属性",

AnchorProp			: "锚点属性",
ButtonProp			: "按钮属性",
CheckboxProp		: "核取方块属性",
HiddenFieldProp		: "隐藏栏位属性",
RadioButtonProp		: "选项按钮属性",
ImageButtonProp		: "影像按钮属性",
TextFieldProp		: "文字方块属性",
SelectionFieldProp	: "清单/选单属性",
TextareaProp		: "文字区域属性",
FormProp			: "表单属性",

FontFormats			: "本文;已格式化;位址;标题 1;标题 2;标题 3;标题 4;标题 5;标题 6;本文 (DIV)",		//REVIEW : Check _getfontformat.html

// Alerts and Messages
ProcessingXHTML		: "处理 XHTML 中，请稍候…",
Done				: "完成",
PasteWordConfirm	: "您想贴上的文字似乎是自 Word 复制而来，请问您是否要先清除 Word 的格式後再行贴上？",
NotCompatiblePaste	: "此指令仅在 Internet Explorer 5.5 或以上的版本有效。请问您是否同意不清除格式即贴上？",
UnknownToolbarItem	: "未知工具列项目 \"%1\"",
UnknownCommand		: "未知指令名称 \"%1\"",
NotImplemented		: "尚未安装此指令",
UnknownToolbarSet	: "工具列设定 \"%1\" 不存在",
NoActiveX			: "浏览器的安全性设定限制了本编辑器的某些功能。您必须启用安全性设定中的「执行ActiveX控制项与外挂程式」项目，否则本编辑器将会出现错误并缺少某些功能",
BrowseServerBlocked : "无法开启资源浏览器，请确定所有快显视窗封锁程式是否关闭",
DialogBlocked		: "无法开启对话视窗，请确定所有快显视窗封锁程式是否关闭",

// Dialogs
DlgBtnOK			: "确定",
DlgBtnCancel		: "取消",
DlgBtnClose			: "关闭",
DlgBtnBrowseServer	: "浏览伺服器端",
DlgAdvancedTag		: "进阶",
DlgOpOther			: "<其他>",
DlgInfoTab			: "资讯",
DlgAlertUrl			: "请插入 URL",

// General Dialogs Labels
DlgGenNotSet		: "<尚未设定>",
DlgGenId			: "ID",
DlgGenLangDir		: "语言方向",
DlgGenLangDirLtr	: "由左而右 (LTR)",
DlgGenLangDirRtl	: "由右而左 (RTL)",
DlgGenLangCode		: "语言代码",
DlgGenAccessKey		: "存取键",
DlgGenName			: "名称",
DlgGenTabIndex		: "定位顺序",
DlgGenLongDescr		: "详细 URL",
DlgGenClass			: "样式表类别",
DlgGenTitle			: "标题",
DlgGenContType		: "内容类型",
DlgGenLinkCharset	: "连结资源之编码",
DlgGenStyle			: "样式",

// Image Dialog
DlgImgTitle			: "影像属性",
DlgImgInfoTab		: "影像资讯",
DlgImgBtnUpload		: "上传至伺服器",
DlgImgURL			: "URL",
DlgImgUpload		: "上传",
DlgImgAlt			: "替代文字",
DlgImgWidth			: "宽度",
DlgImgHeight		: "高度",
DlgImgLockRatio		: "等比例",
DlgBtnResetSize		: "重设为原大小",
DlgImgBorder		: "边框",
DlgImgHSpace		: "水平距离",
DlgImgVSpace		: "垂直距离",
DlgImgAlign			: "对齐",
DlgImgAlignLeft		: "靠左对齐",
DlgImgAlignAbsBottom: "绝对下方",
DlgImgAlignAbsMiddle: "绝对中间",
DlgImgAlignBaseline	: "基准线",
DlgImgAlignBottom	: "靠下对齐",
DlgImgAlignMiddle	: "置中对齐",
DlgImgAlignRight	: "靠右对齐",
DlgImgAlignTextTop	: "文字上方",
DlgImgAlignTop		: "靠上对齐",
DlgImgPreview		: "预览",
DlgImgAlertUrl		: "请输入影像 URL",
DlgImgLinkTab		: "超连结",

// Flash Dialog
DlgFlashTitle		: "Flash 属性",
DlgFlashChkPlay		: "自动播放",
DlgFlashChkLoop		: "重复",
DlgFlashChkMenu		: "开启选单",
DlgFlashScale		: "缩放",
DlgFlashScaleAll	: "全部显示",
DlgFlashScaleNoBorder	: "无边框",
DlgFlashScaleFit	: "精确符合",

// Link Dialog
DlgLnkWindowTitle	: "超连结",
DlgLnkInfoTab		: "超连结资讯",
DlgLnkTargetTab		: "目标",

DlgLnkType			: "超连接类型",
DlgLnkTypeURL		: "URL",
DlgLnkTypeAnchor	: "本页锚点",
DlgLnkTypeEMail		: "电子邮件",
DlgLnkProto			: "通讯协定",
DlgLnkProtoOther	: "<其他>",
DlgLnkURL			: "URL",
DlgLnkAnchorSel		: "请选择锚点",
DlgLnkAnchorByName	: "依锚点名称",
DlgLnkAnchorById	: "依元件 ID",
DlgLnkNoAnchors		: "<本文件尚无可用之锚点>",		//REVIEW : Change < and > with ( and )
DlgLnkEMail			: "电子邮件",
DlgLnkEMailSubject	: "邮件主旨",
DlgLnkEMailBody		: "邮件内容",
DlgLnkUpload		: "上传",
DlgLnkBtnUpload		: "传送至伺服器",

DlgLnkTarget		: "目标",
DlgLnkTargetFrame	: "<框架>",
DlgLnkTargetPopup	: "<快显视窗>",
DlgLnkTargetBlank	: "新视窗 (_blank)",
DlgLnkTargetParent	: "父视窗 (_parent)",
DlgLnkTargetSelf	: "本视窗 (_self)",
DlgLnkTargetTop		: "最上层视窗 (_top)",
DlgLnkTargetFrameName	: "目标框架名称",
DlgLnkPopWinName	: "快显视窗名称",
DlgLnkPopWinFeat	: "快显视窗属性",
DlgLnkPopResize		: "可调整大小",
DlgLnkPopLocation	: "网址列",
DlgLnkPopMenu		: "选单列",
DlgLnkPopScroll		: "卷轴",
DlgLnkPopStatus		: "状态列",
DlgLnkPopToolbar	: "工具列",
DlgLnkPopFullScrn	: "全萤幕 (IE)",
DlgLnkPopDependent	: "从属 (NS)",
DlgLnkPopWidth		: "宽",
DlgLnkPopHeight		: "高",
DlgLnkPopLeft		: "左",
DlgLnkPopTop		: "右",

DlnLnkMsgNoUrl		: "请输入欲连结的 URL",
DlnLnkMsgNoEMail	: "请输入电子邮件位址",
DlnLnkMsgNoAnchor	: "请选择锚点",
DlnLnkMsgInvPopName	: "快显名称必须以「英文字母」为开头，且不得含有空白",

// Color Dialog
DlgColorTitle		: "请选择颜色",
DlgColorBtnClear	: "清除",
DlgColorHighlight	: "预览",
DlgColorSelected	: "选择",

// Smiley Dialog
DlgSmileyTitle		: "插入表情符号",

// Special Character Dialog
DlgSpecialCharTitle	: "请选择特殊符号",

// Table Dialog
DlgTableTitle		: "表格属性",
DlgTableRows		: "列数",
DlgTableColumns		: "栏数",
DlgTableBorder		: "边框",
DlgTableAlign		: "对齐",
DlgTableAlignNotSet	: "<未设定>",
DlgTableAlignLeft	: "靠左对齐",
DlgTableAlignCenter	: "置中",
DlgTableAlignRight	: "靠右对齐",
DlgTableWidth		: "宽度",
DlgTableWidthPx		: "像素",
DlgTableWidthPc		: "百分比",
DlgTableHeight		: "高度",
DlgTableCellSpace	: "间距",
DlgTableCellPad		: "内距",
DlgTableCaption		: "标题",
DlgTableSummary		: "摘要",

// Table Cell Dialog
DlgCellTitle		: "储存格属性",
DlgCellWidth		: "宽度",
DlgCellWidthPx		: "像素",
DlgCellWidthPc		: "百分比",
DlgCellHeight		: "高度",
DlgCellWordWrap		: "自动换行",
DlgCellWordWrapNotSet	: "<尚未设定>",
DlgCellWordWrapYes	: "是",
DlgCellWordWrapNo	: "否",
DlgCellHorAlign		: "水平对齐",
DlgCellHorAlignNotSet	: "<尚未设定>",
DlgCellHorAlignLeft	: "靠左对齐",
DlgCellHorAlignCenter	: "置中",
DlgCellHorAlignRight: "靠右对齐",
DlgCellVerAlign		: "垂直对齐",
DlgCellVerAlignNotSet	: "<尚未设定>",
DlgCellVerAlignTop	: "靠上对齐",
DlgCellVerAlignMiddle	: "置中",
DlgCellVerAlignBottom	: "靠下对齐",
DlgCellVerAlignBaseline	: "基准线",
DlgCellRowSpan		: "合并列数",
DlgCellCollSpan		: "合并栏数",
DlgCellBackColor	: "背景颜色",
DlgCellBorderColor	: "边框颜色",
DlgCellBtnSelect	: "请选择…",

// Find Dialog
DlgFindTitle		: "寻找",
DlgFindFindBtn		: "寻找",
DlgFindNotFoundMsg	: "未找到指定的文字。",

// Replace Dialog
DlgReplaceTitle			: "取代",
DlgReplaceFindLbl		: "寻找:",
DlgReplaceReplaceLbl	: "取代:",
DlgReplaceCaseChk		: "大小写须相符",
DlgReplaceReplaceBtn	: "取代",
DlgReplaceReplAllBtn	: "全部取代",
DlgReplaceWordChk		: "全字相符",

// Paste Operations / Dialog
PasteErrorCut	: "浏览器的安全性设定不允许编辑器自动执行剪下动作。请使用快捷键 (Ctrl+X) 剪下。",
PasteErrorCopy	: "浏览器的安全性设定不允许编辑器自动执行复制动作。请使用快捷键 (Ctrl+C) 复制。",

PasteAsText		: "贴为纯文字格式",
PasteFromWord	: "自 Word 贴上",

DlgPasteMsg2	: "请使用快捷键 (<strong>Ctrl+V</strong>) 贴到下方区域中并按下 <strong>确定</strong>",
DlgPasteSec		: "Because of your browser security settings, the editor is not able to access your clipboard data directly. You are required to paste it again in this window.",	//MISSING
DlgPasteIgnoreFont		: "移除字型设定",
DlgPasteRemoveStyles	: "移除样式设定",
DlgPasteCleanBox		: "清除文字区域",

// Color Picker
ColorAutomatic	: "自动",
ColorMoreColors	: "更多颜色…",

// Document Properties
DocProps		: "文件属性",

// Anchor Dialog
DlgAnchorTitle		: "命名锚点",
DlgAnchorName		: "锚点名称",
DlgAnchorErrorName	: "请输入锚点名称",

// Speller Pages Dialog
DlgSpellNotInDic		: "不在字典中",
DlgSpellChangeTo		: "更改为",
DlgSpellBtnIgnore		: "忽略",
DlgSpellBtnIgnoreAll	: "全部忽略",
DlgSpellBtnReplace		: "取代",
DlgSpellBtnReplaceAll	: "全部取代",
DlgSpellBtnUndo			: "复原",
DlgSpellNoSuggestions	: "- 无建议值 -",
DlgSpellProgress		: "进行拼字检查中…",
DlgSpellNoMispell		: "拼字检查完成：未发现拼字错误",
DlgSpellNoChanges		: "拼字检查完成：未更改任何单字",
DlgSpellOneChange		: "拼字检查完成：更改了 1 个单字",
DlgSpellManyChanges		: "拼字检查完成：更改了 %1 个单字",

IeSpellDownload			: "尚未安装拼字检查元件。您是否想要现在下载？",

// Button Dialog
DlgButtonText		: "显示文字 (值)",
DlgButtonType		: "类型",
DlgButtonTypeBtn	: "按钮 (Button)",
DlgButtonTypeSbm	: "送出 (Submit)",
DlgButtonTypeRst	: "重设 (Reset)",

// Checkbox and Radio Button Dialogs
DlgCheckboxName		: "名称",
DlgCheckboxValue	: "选取值",
DlgCheckboxSelected	: "已选取",

// Form Dialog
DlgFormName		: "名称",
DlgFormAction	: "动作",
DlgFormMethod	: "方法",

// Select Field Dialog
DlgSelectName		: "名称",
DlgSelectValue		: "选取值",
DlgSelectSize		: "大小",
DlgSelectLines		: "行",
DlgSelectChkMulti	: "可多选",
DlgSelectOpAvail	: "可用选项",
DlgSelectOpText		: "显示文字",
DlgSelectOpValue	: "值",
DlgSelectBtnAdd		: "新增",
DlgSelectBtnModify	: "修改",
DlgSelectBtnUp		: "上移",
DlgSelectBtnDown	: "下移",
DlgSelectBtnSetValue : "设为预设值",
DlgSelectBtnDelete	: "删除",

// Textarea Dialog
DlgTextareaName	: "名称",
DlgTextareaCols	: "字元宽度",
DlgTextareaRows	: "列数",

// Text Field Dialog
DlgTextName			: "名称",
DlgTextValue		: "值",
DlgTextCharWidth	: "字元宽度",
DlgTextMaxChars		: "最多字元数",
DlgTextType			: "类型",
DlgTextTypeText		: "文字",
DlgTextTypePass		: "密码",

// Hidden Field Dialog
DlgHiddenName	: "名称",
DlgHiddenValue	: "值",

// Bulleted List Dialog
BulletedListProp	: "项目清单属性",
NumberedListProp	: "编号清单属性",
DlgLstStart			: "起始编号",
DlgLstType			: "清单类型",
DlgLstTypeCircle	: "圆圈",
DlgLstTypeDisc		: "圆点",
DlgLstTypeSquare	: "方块",
DlgLstTypeNumbers	: "数字 (1, 2, 3)",
DlgLstTypeLCase		: "小写字母 (a, b, c)",
DlgLstTypeUCase		: "大写字母 (A, B, C)",
DlgLstTypeSRoman	: "小写罗马数字 (i, ii, iii)",
DlgLstTypeLRoman	: "大写罗马数字 (I, II, III)",

// Document Properties Dialog
DlgDocGeneralTab	: "一般",
DlgDocBackTab		: "背景",
DlgDocColorsTab		: "显色与边界",
DlgDocMetaTab		: "Meta 资料",

DlgDocPageTitle		: "页面标题",
DlgDocLangDir		: "语言方向",
DlgDocLangDirLTR	: "由左而右 (LTR)",
DlgDocLangDirRTL	: "由右而左 (RTL)",
DlgDocLangCode		: "语言代码",
DlgDocCharSet		: "字元编码",
DlgDocCharSetCE		: "中欧语系",
DlgDocCharSetCT		: "正体中文 (Big5)",
DlgDocCharSetCR		: "斯拉夫文",
DlgDocCharSetGR		: "希腊文",
DlgDocCharSetJP		: "日文",
DlgDocCharSetKR		: "韩文",
DlgDocCharSetTR		: "土耳其文",
DlgDocCharSetUN		: "Unicode (UTF-8)",
DlgDocCharSetWE		: "西欧语系",
DlgDocCharSetOther	: "其他字元编码",

DlgDocDocType		: "文件类型",
DlgDocDocTypeOther	: "其他文件类型",
DlgDocIncXHTML		: "包含 XHTML 定义",
DlgDocBgColor		: "背景颜色",
DlgDocBgImage		: "背景影像",
DlgDocBgNoScroll	: "浮水印",
DlgDocCText			: "文字",
DlgDocCLink			: "超连结",
DlgDocCVisited		: "已浏览过的超连结",
DlgDocCActive		: "作用中的超连结",
DlgDocMargins		: "页面边界",
DlgDocMaTop			: "上",
DlgDocMaLeft		: "左",
DlgDocMaRight		: "右",
DlgDocMaBottom		: "下",
DlgDocMeIndex		: "文件索引关键字 (用半形逗号[,]分隔)",
DlgDocMeDescr		: "文件说明",
DlgDocMeAuthor		: "作者",
DlgDocMeCopy		: "版权所有",
DlgDocPreview		: "预览",

// Templates Dialog
Templates			: "样版",
DlgTemplatesTitle	: "内容样版",
DlgTemplatesSelMsg	: "请选择欲开启的样版<br> (原有的内容将会被清除):",
DlgTemplatesLoading	: "读取样版清单中，请稍候…",
DlgTemplatesNoTpl	: "(无样版)",
DlgTemplatesReplace	: "取代原有内容",

// About Dialog
DlgAboutAboutTab	: "关於",
DlgAboutBrowserInfoTab	: "浏览器资讯",
DlgAboutLicenseTab	: "许可证",
DlgAboutVersion		: "版本",
DlgAboutInfo		: "想获得更多资讯请至 "
};