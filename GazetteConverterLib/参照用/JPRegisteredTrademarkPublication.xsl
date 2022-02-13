<?xml version="1.0" encoding="UTF-8" ?>
<!--****************************************-->
<!--XSL Version:V1.0-01-01,DATE 2022.01.04  -->
<!--****************************************-->
<xsl:transform version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:jpcom="http://www.jpo.go.jp/standards/XMLSchema/ST96/JPCommon"
	xmlns:jppat="http://www.jpo.go.jp/standards/XMLSchema/ST96/JPPatent"
	xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common"
	xmlns:pat="http://www.wipo.int/standards/XMLSchema/ST96/Patent"
	xmlns:tmk="http://www.wipo.int/standards/XMLSchema/ST96/Trademark"
	xmlns:jptmk="http://www.jpo.go.jp/standards/XMLSchema/ST96/JPTrademark">
	<xsl:include href="comP.xsl" />
	<xsl:template match="/">
		<html>
			<head>
				<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
				<title>商標公報</title>
				<style type="text/css">body {font-family: 'ＭＳ 明朝'; }b{font-family:
					'ＭＳ Ｐゴシック'; }</style>
			</head>
			<body>
				<xsl:apply-templates select="jptmk:RegisteredTrademarkPublication" />
			</body>
			<script type="text/javascript" src="../../../../../XSL/translater.js"></script>
			<script type="text/javascript" src="../../../../../XSL/commonJS.js"></script>
		</html>
	</xsl:template>
	<!-- 商標公報 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication -->
	<xsl:template match="jptmk:RegisteredTrademarkPublication"
		name="template6">

		<xsl:for-each select="jptmk:Publication">
			<!--公報 -->
			<xsl:call-template name="template10" />
		</xsl:for-each>
		<xsl:for-each select="jptmk:PlainLanguageDesignationText">
			<!--公報種別 -->
			<!--表示順：3 -->
			<xsl:call-template name="template15" />
		</xsl:for-each>
		<xsl:for-each select="jptmk:Publication">
			<!--公報 -->
			<xsl:call-template name="template10-B" />
		</xsl:for-each>
		<xsl:for-each select="tmk:NationalMarkRegistrationDate">
			<!--登録日 -->
			<!--表示順：5 -->
			<xsl:call-template name="template16" />
		</xsl:for-each>
		<xsl:for-each select="jptmk:MarkRepresentation">
			<!--商標グループ -->
			<xsl:call-template name="template17" />
		</xsl:for-each>
		<xsl:for-each select="jptmk:GoodsServiceClassNumber">
			<!--商品・役務の区分の数 -->
			<!--表示順：10 -->
			<xsl:call-template name="template36" />
		</xsl:for-each>
		<xsl:for-each select="jptmk:GoodsServices">
			<!--商品・役務 -->
			<xsl:call-template name="template37" />
		</xsl:for-each>
		<xsl:for-each select="com:ClassificationVersion">
			<!--国際分類版表示 -->
			<!--表示順：12 -->
			<xsl:call-template name="template43" />
		</xsl:for-each>
		<xsl:for-each select="jptmk:NiceClassNumberText">
			<!--国際分類 -->
			<!--表示順：13 -->
			<xsl:call-template name="template44" />
		</xsl:for-each>
		<xsl:for-each select="com:ApplicationNumber">
			<!--出願番号グループ -->
			<xsl:call-template name="template45" />
		</xsl:for-each>
		<xsl:for-each select="jptmk:NationalApplicationFilingDateBag">
			<!--出願日グループ -->
			<xsl:call-template name="template47" />
		</xsl:for-each>
		<xsl:for-each select="jptmk:SpecialApplicationIndication">
			<!--特殊出願表示グループ -->
			<xsl:call-template name="template50" />
		</xsl:for-each>
		<xsl:for-each select="jptmk:AppealNumber">
			<!--審判番号 -->
			<!--表示順：17 -->
			<xsl:call-template name="template53" />
		</xsl:for-each>
		<xsl:for-each select="jptmk:AppealDate">
			<!--審判請求日 -->
			<!--表示順：18 -->
			<xsl:call-template name="template54" />
		</xsl:for-each>
		<xsl:for-each select="jptmk:PriorityBag">
			<!--パリ条約による優先権等の主張 -->
			<xsl:call-template name="template55" />
		</xsl:for-each>
		<xsl:for-each select="jptmk:HolderRepresentativeBag">
			<!--商標権者グループ -->
			<xsl:call-template name="template61" />
		</xsl:for-each>
		<xsl:for-each select="jptmk:RecognizableGoodsService">
			<!--第３条第２項適用 -->
			<!--表示順：30 -->
			<xsl:call-template name="template78" />
		</xsl:for-each>
		<xsl:for-each select="jptmk:SpecialProvisionConcerningApplicationFilingTime">
			<!--第９条第１項適用 -->
			<!--表示順：31 -->
			<xsl:call-template name="template80" />
		</xsl:for-each>
		<xsl:for-each select="jptmk:ColorProvision">
			<!--第５条第４項適用 -->
			<!--表示順：32 -->
			<xsl:call-template name="template82" />
		</xsl:for-each>
		<xsl:for-each select="jptmk:RegistrationRescindException">
			<!--第６８条の３２第１項適用 -->
			<!--表示順：33 -->
			<xsl:call-template name="template85" />
		</xsl:for-each>
		<xsl:for-each select="jptmk:ProtocolDenunciationException">
			<!--第６８条の３３第１項適用 -->
			<!--表示順：34 -->
			<xsl:call-template name="template88" />
		</xsl:for-each>
		<xsl:for-each select="jptmk:SpecialProvisionConcerningOppositionRegistration">
			<!--第６８条の３７適用 -->
			<!--表示順：35 -->
			<xsl:call-template name="template91" />
		</xsl:for-each>
		<xsl:for-each select="jptmk:ColorIndicationText">
			<!--色彩表示 -->
			<!--表示順：36 -->
			<xsl:call-template name="template94" />
		</xsl:for-each>
		<xsl:for-each select="com:RequestExaminationCategory">
			<!--早期審査対象出願 -->
			<!--表示順：37 -->
			<xsl:call-template name="template95" />
		</xsl:for-each>
		<xsl:for-each select="jptmk:RequestAppealTrialExaminationCategory">
			<!--早期審理対象出願 -->
			<!--表示順：38 -->
			<xsl:call-template name="template96" />
		</xsl:for-each>
		<xsl:for-each select="jptmk:SpecialTrademark">
			<!--特例商標 -->
			<!--表示順：39 -->
			<xsl:call-template name="template97" />
		</xsl:for-each>
		<xsl:for-each select="jptmk:OverlappedOtherApplication">
			<!--重複する他の出願 -->
			<!--表示順：40 -->
			<xsl:call-template name="template98" />
		</xsl:for-each>
		<xsl:for-each select="jptmk:OverlappedOtherRegistration">
			<!--重複する他の登録 -->
			<!--表示順：41 -->
			<xsl:call-template name="template99" />
		</xsl:for-each>
		<xsl:for-each select="jptmk:OverlappedOtherApplicationReference">
			<!--重複する他の出願（参考情報） -->
			<!--表示順：42 -->
			<xsl:call-template name="template100" />
		</xsl:for-each>
		<xsl:for-each select="jptmk:DistinctionLaw">
			<!--法区分 -->
			<!--表示順：43 -->
			<xsl:call-template name="template101" />
		</xsl:for-each>
		<xsl:for-each select="jptmk:ExaminerBag">
			<!--審査官グループ -->
			<xsl:call-template name="template102" />
		</xsl:for-each>
		<xsl:for-each select="jptmk:AppealExaminerBag">
			<!--審判官グループ -->
			<xsl:call-template name="template107" />
		</xsl:for-each>
		<xsl:for-each select="jptmk:Pronunciation">
			<!--称呼データ -->
			<!--表示順：47 -->
			<xsl:call-template name="template116" />
		</xsl:for-each>
		<xsl:for-each select="tmk:PseudoMarkText">
			<!--検索用商標 -->
			<!--表示順：48 -->
			<xsl:call-template name="template117" />
		</xsl:for-each>
		<xsl:for-each select="jptmk:SimilarGroupBag">
			<!--類似群コードグループ -->
			<!--表示順：49 -->
			<xsl:call-template name="template118" />
		</xsl:for-each>
		<xsl:for-each select="jptmk:ViennaFigureClassificationText">
			<!--ウィーン分類 -->
			<!--表示順：50 -->
			<xsl:call-template name="template122" />
		</xsl:for-each>
	</xsl:template>
	<!-- 公報 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:Publication -->
	<xsl:template match="jptmk:Publication" name="template10">

		<xsl:for-each select="com:IPOfficeCode">
			<!--発行国 -->
			<!--表示順：1 -->
			<xsl:call-template name="template14" />
		</xsl:for-each>
		<xsl:for-each select="com:PublicationDate">
			<!--発行日 -->
			<!--表示順：2 -->
			<xsl:call-template name="template13" />
		</xsl:for-each>
	</xsl:template>
	<!-- 公報 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:Publication -->
	<xsl:template match="jptmk:Publication" name="template10-B">

		<xsl:for-each select="com:PublicationIdentifier">
			<!--登録番号 -->
			<!--表示順：4 -->
			<xsl:call-template name="template11" />
		</xsl:for-each>
	</xsl:template>
	<!-- 登録番号 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:Publication/com:PublicationIdentifier -->
	<xsl:template match="com:PublicationIdentifier" name="template11">
		<div>
			<xsl:text>（１１１）【登録番号】</xsl:text>
			<span data-function="editRegistrationNumber" data-size="2">
				<xsl:attribute name="data-value1"><xsl:text>T</xsl:text></xsl:attribute>
				<xsl:attribute name="data-value2"><xsl:value-of select="." /></xsl:attribute>
			</span>

		</div>

	</xsl:template>
	<!-- 発行日 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:Publication/com:PublicationDate -->
	<xsl:template match="com:PublicationDate" name="template13">
		<div>
			<xsl:text>（４５０）【発行日】</xsl:text>
			<span data-function="convJPdate_fromADToFullChar" data-size="1">
				<xsl:attribute name="data-value1"><xsl:value-of select="." /></xsl:attribute>
			</span>

		</div>

	</xsl:template>
	<!-- 発行国 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:Publication/com:IPOfficeCode -->
	<xsl:template match="com:IPOfficeCode" name="template14">
		<div>
			<xsl:text>（１９０）【発行国】</xsl:text>
			<xsl:text>日本国特許庁（ＪＰ）</xsl:text>
		</div>

	</xsl:template>
	<!-- 公報種別 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:PlainLanguageDesignationText -->
	<xsl:template match="jptmk:PlainLanguageDesignationText"
		name="template15">
		<div>
			<xsl:text>【公報種別】</xsl:text>
			<xsl:value-of select="." />
		</div>

	</xsl:template>
	<!-- 登録日 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/tmk:NationalMarkRegistrationDate -->
	<xsl:template match="tmk:NationalMarkRegistrationDate"
		name="template16">
		<div>
			<xsl:text>（１５１）【登録日】</xsl:text>
			<span data-function="convJPdate_fromADToFullChar" data-size="1">
				<xsl:attribute name="data-value1"><xsl:value-of select="." /></xsl:attribute>
			</span>

		</div>

	</xsl:template>
	<!-- 商標グループ -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:MarkRepresentation -->
	<xsl:template match="jptmk:MarkRepresentation" name="template17">
		<xsl:for-each select="jptmk:MarkReproduction">
			<!--商標 -->
			<!--表示順：6 -->
			<xsl:call-template name="template19" />
		</xsl:for-each>
		<xsl:for-each select="jptmk:MarkFeatureCategory">
			<!--商標の特性種別 -->
			<!--表示順：7 -->
			<xsl:call-template name="template18" />
		</xsl:for-each>

		<xsl:for-each select="jptmk:MarkDescriptionBag">
			<!-- 商標の詳細な説明グループ -->
			<xsl:call-template name="template34" />
		</xsl:for-each>
		<xsl:for-each select="jptmk:MarkReproduction/jptmk:MarkSoundBag">
			<!--音声グループ -->
			<xsl:call-template name="template30" />
		</xsl:for-each>
	</xsl:template>
	<!-- 商標の特性種別 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:MarkRepresentation/jptmk:MarkFeatureCategory -->
	<xsl:template match="jptmk:MarkFeatureCategory" name="template18">
		<xsl:if test="text()='Three dimensional'">
			<xsl:if test="../jptmk:MarkReproduction/jptmk:MarkCategory='Trademark'">
				<div>
					<xsl:text>（５５４）【立体商標】</xsl:text>
				</div>
			</xsl:if>
			<xsl:if test="../jptmk:MarkReproduction/jptmk:MarkCategory='Defensive mark'">
				<div>
					<xsl:text>（５５４）【立体標章】</xsl:text>
				</div>
			</xsl:if>
		</xsl:if>
		<xsl:if test="text()='Colour'">
			<xsl:if test="../jptmk:MarkReproduction/jptmk:MarkCategory='Trademark'">
				<div>
					<xsl:text>【色彩のみからなる商標】</xsl:text>
				</div>
			</xsl:if>
			<xsl:if test="../jptmk:MarkReproduction/jptmk:MarkCategory='Defensive mark'">
				<div>
					<xsl:text>【色彩のみからなる標章】</xsl:text>
				</div>
			</xsl:if>
		</xsl:if>
		<xsl:if test="text()='Sound'">
			<xsl:if test="../jptmk:MarkReproduction/jptmk:MarkCategory='Trademark'">
					<div>
						<xsl:text>（５５０）【音商標】</xsl:text>
					</div>
				</xsl:if>
				<xsl:if test="../jptmk:MarkReproduction/jptmk:MarkCategory='Defensive mark'">
					<div>
					<xsl:text>（５５０）【音標章】</xsl:text>
					</div>
				</xsl:if>
			</xsl:if>
			<xsl:if test="text()='Hologram'">
				<xsl:if test="../jptmk:MarkReproduction/jptmk:MarkCategory='Trademark'">
					<div>
					<xsl:text>【ホログラム商標】</xsl:text>
					</div>
				</xsl:if>
				<xsl:if test="../jptmk:MarkReproduction/jptmk:MarkCategory='Defensive mark'">
					<div>
						<xsl:text>【ホログラム標章】</xsl:text>
					</div>
				</xsl:if>
			</xsl:if>
		<xsl:if test="text()='Motion'">
			<xsl:if test="../jptmk:MarkReproduction/jptmk:MarkCategory='Trademark'">
				<div>
					<xsl:text>【動き商標】</xsl:text>
				</div>
			</xsl:if>
			<xsl:if test="../jptmk:MarkReproduction/jptmk:MarkCategory='Defensive mark'">
				<div>
					<xsl:text>【動き標章】</xsl:text>
				</div>
			</xsl:if>
		</xsl:if>
		<xsl:if test="text()='Position'">
			<xsl:if test="../jptmk:MarkReproduction/jptmk:MarkCategory='Trademark'">
				<div>
					<xsl:text>【位置商標】</xsl:text>
				</div>
			</xsl:if>
			<xsl:if test="../jptmk:MarkReproduction/jptmk:MarkCategory='Defensive mark'">
				<div>
					<xsl:text>【位置標章】</xsl:text>
				</div>
			</xsl:if>
		</xsl:if>
		<xsl:if test="text()='Other'">
			<xsl:if test="../jptmk:MarkReproduction/jptmk:MarkCategory='Trademark'">
				<div>
					<xsl:text>【その他の商標】</xsl:text>
				</div>
			</xsl:if>
			<xsl:if test="../jptmk:MarkReproduction/jptmk:MarkCategory='Defensive mark'">
				<div>
					<xsl:text>【その他の標章】</xsl:text>
				</div>
			</xsl:if>
		</xsl:if>
		<xsl:if test="text()='Collective'">
			<div>
				<xsl:text>（５５１）【団体商標】</xsl:text>
			</div>
		</xsl:if>
		<xsl:if test="text()='Regional'">
			<div>
				<xsl:text>（５５１）【地域団体商標】</xsl:text>
			</div>
		</xsl:if>
	</xsl:template>
	<!-- 商標 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:MarkRepresentation/jptmk:MarkReproduction -->
	<xsl:template match="jptmk:MarkReproduction" name="template19">
		<div>
			<xsl:if test="jptmk:MarkCategory='Trademark'">
				<xsl:text>（５４０）【登録商標】</xsl:text>
			</xsl:if>
			<xsl:if test="jptmk:MarkCategory='Defensive mark'">
				<xsl:text>（５４０）【登録防護標章】</xsl:text>
			</xsl:if>
			<xsl:if test="jptmk:MarkCategory='Word'">
				<xsl:text>（５４１）【登録商標（標準文字）】</xsl:text>
			</xsl:if>
			<xsl:if test="jptmk:MarkCategory='Defensive word'">
				<xsl:text>（５４１）【登録防護標章（標準文字）】</xsl:text>
			</xsl:if>
		</div>
		<!-- 順不同のため -->
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="name()='tmk:WordMarkSpecification'">
					<!--文字グループ -->
					<xsl:call-template name="template21" />
				</xsl:when>
				<xsl:when test="name()='tmk:MarkImageBag'">
					<!--イメージグループ -->
					<xsl:call-template name="template23" />
				</xsl:when>
				<xsl:otherwise></xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<!-- 文字グループ -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:MarkRepresentation/jptmk:MarkReproduction/tmk:WordMarkSpecification -->
	<xsl:template match="tmk:WordMarkSpecification" name="template21">

		<xsl:for-each select="tmk:MarkSignificantVerbalElementText">
			<!--文字 -->
			<xsl:call-template name="template22" />
		</xsl:for-each>
	</xsl:template>
	<!-- 文字 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:MarkRepresentation/jptmk:MarkReproduction/tmk:WordMarkSpecification/tmk:MarkSignificantVerbalElementText -->
	<xsl:template match="tmk:MarkSignificantVerbalElementText"
		name="template22">
		<div>
			<xsl:text></xsl:text>
			<xsl:value-of select="." />
		</div>

	</xsl:template>
	<!-- イメージグループ -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:MarkRepresentation/jptmk:MarkReproduction/tmk:MarkImageBag -->
	<xsl:template match="tmk:MarkImageBag" name="template23">

		<xsl:for-each select="tmk:MarkImage">
			<!--イメージ -->
			<xsl:call-template name="template24" />
		</xsl:for-each>
	</xsl:template>
	<!-- イメージ -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:MarkRepresentation/jptmk:MarkReproduction/tmk:MarkImageBag/tmk:MarkImage -->
	<xsl:template match="tmk:MarkImage" name="template24">
        <div>
            <a>
                <xsl:attribute name="href">
                    <xsl:value-of select="com:FileName" />
                </xsl:attribute>
                <xsl:value-of select="com:FileName" />
            </a>
        </div>
	</xsl:template>

	<!-- 音声グループ -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:MarkRepresentation/jptmk:MarkReproduction/jptmk:MarkSoundBag -->
	<xsl:template match="jptmk:MarkSoundBag" name="template30">

		<xsl:for-each select="jptmk:MarkSoundText">
			<!--音声ファイル -->
			<!--表示順：9 -->
			<xsl:call-template name="template33" />
		</xsl:for-each>
	</xsl:template>
	<!-- 音声ファイル -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:MarkRepresentation/jptmk:MarkReproduction/jptmk:MarkSoundBag/jptmk:MarkSoundText -->
	<xsl:template match="jptmk:MarkSoundText" name="template33">
		<div>
			<xsl:text>【音声ファイル】</xsl:text>
			<xsl:value-of select="." />
		</div>

	</xsl:template>
	<!-- 商標の詳細な説明グループ -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:MarkRepresentation/jptmk:MarkDescriptionBag -->
	<xsl:template match="jptmk:MarkDescriptionBag" name="template34">

		<xsl:for-each select="tmk:MarkDescriptionText">
			<!--商標の詳細な説明 -->
			<!--表示順：8 -->
			<xsl:call-template name="template35" />
		</xsl:for-each>
	</xsl:template>
	<!-- 商標の詳細な説明 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:MarkRepresentation/jptmk:MarkDescriptionBag/tmk:MarkDescriptionText -->
	<xsl:template match="tmk:MarkDescriptionText" name="template35">
		<div>
			<!-- XXX:項番15のtmk:MarkCategoryの設定値に応じて項目を変える -->
			<xsl:if test="../../jptmk:MarkReproduction/jptmk:MarkCategory='Trademark'">
				<xsl:text>【商標の詳細な説明】</xsl:text>
				<xsl:value-of select="." />
			</xsl:if>
			<xsl:if test="../../jptmk:MarkReproduction/jptmk:MarkCategory='Defensive mark'">
				<xsl:text>【標章の詳細な説明】</xsl:text>
				<xsl:value-of select="." />
			</xsl:if>
		</div>

	</xsl:template>
	<!-- 商品・役務の区分の数 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:GoodsServiceClassNumber -->
	<xsl:template match="jptmk:GoodsServiceClassNumber" name="template36">
		<div>
			<xsl:text>（５００）【商品及び役務の区分の数】</xsl:text>
			<span data-function="convHalfCharToFullChar" data-size="1">
				<xsl:attribute name="data-value1"><xsl:value-of select="." /></xsl:attribute>
			</span>

		</div>

	</xsl:template>
	<!-- 商品・役務 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:GoodsServices -->
	<xsl:template match="jptmk:GoodsServices" name="template37">

		<xsl:for-each select="tmk:ClassificationKindCode">
			<!--商品・役務の区分並びに指定商品・役務 -->
			<!--表示順：11 -->
			<xsl:call-template name="template38" />
		</xsl:for-each>
		<xsl:for-each select="jptmk:ClassDescriptionBag">
			<!--商品役務並びに区分グループ -->
			<xsl:call-template name="template39" />
		</xsl:for-each>
	</xsl:template>
	<!-- 商品・役務の区分並びに指定商品・役務 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:GoodsServices/tmk:ClassificationKindCode -->
	<xsl:template match="tmk:ClassificationKindCode" name="template38">
		<div>
			<xsl:if test="text()='Nice'">
				<xsl:text>（５１１）【商品及び役務の区分並びに指定商品又は指定役務】</xsl:text>
			</xsl:if>
			<xsl:if test="text()='Domestic'">
				<xsl:text>（５１２）【指定商品及び商品の区分】</xsl:text>
			</xsl:if>
			<!-- XXX:商品・役務の区分並びに指定商品・役務を設定する 商品及び役務の区分並びに指定商品または指定役務の場合"Nice"を設定する
				指定商品及び商品の区分の場合"Domestic"を設定する -->
		</div>

	</xsl:template>
	<!-- 商品役務並びに区分グループ -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:GoodsServices/jptmk:ClassDescriptionBag -->
	<xsl:template match="jptmk:ClassDescriptionBag" name="template39">

		<xsl:for-each select="jptmk:ClassDescription">
			<!--商品役務並びに区分 -->
			<xsl:call-template name="template40" />
		</xsl:for-each>
	</xsl:template>
	<!-- 商品役務並びに区分 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:GoodsServices/jptmk:ClassDescriptionBag/jptmk:ClassDescription -->
	<xsl:template match="jptmk:ClassDescription" name="template40">
		<div>
		<xsl:for-each select="tmk:ClassNumber">
			<!--類 -->
			<xsl:call-template name="template41" />
		</xsl:for-each>
		<xsl:for-each select="tmk:GoodsServicesDescriptionText">
			<!--商品役務 -->
			<xsl:call-template name="template42" />
		</xsl:for-each>
		</div>
	</xsl:template>
	<!-- 類 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:GoodsServices/jptmk:ClassDescriptionBag/jptmk:ClassDescription/tmk:ClassNumber -->
	<xsl:template match="tmk:ClassNumber" name="template41">
		<xsl:text>第</xsl:text>
		<span data-function="convHalfCharToFullChar" data-size="1">
			<xsl:attribute name="data-value1"><xsl:value-of select="." /></xsl:attribute>
		</span>
		<xsl:text>類　</xsl:text>
	</xsl:template>
	<!-- 商品役務 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:GoodsServices/jptmk:ClassDescriptionBag/jptmk:ClassDescription/tmk:GoodsServicesDescriptionText -->
	<xsl:template match="tmk:GoodsServicesDescriptionText"
		name="template42">
			<xsl:value-of select="." />
	</xsl:template>
	<!-- 国際分類版表示 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/com:ClassificationVersion -->
	<xsl:template match="com:ClassificationVersion" name="template43">
		<div>
			<!-- XXX:【国際分類第○○版】 -->
			<xsl:text>【国際分類第</xsl:text>
			<span data-function="convHalfCharToFullChar" data-size="1">
				<xsl:attribute name="data-value1"><xsl:value-of select="." /></xsl:attribute>
			</span>
			<xsl:text>版】</xsl:text>
		</div>

	</xsl:template>
	<!-- 国際分類 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:NiceClassNumberText -->
	<xsl:template match="jptmk:NiceClassNumberText" name="template44">
		<div>
			<xsl:text>（５１１）【国際分類】〔</xsl:text>
			<span data-function="replaceString" data-size="1">
				<xsl:attribute name="data-value1"><xsl:value-of select="." /></xsl:attribute>
			</span>
			<xsl:text>〕</xsl:text>
		</div>
	</xsl:template>
	<!-- 出願番号グループ -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/com:ApplicationNumber -->
	<xsl:template match="com:ApplicationNumber" name="template45">
		<xsl:for-each select="com:ApplicationNumberText">
			<!--出願番号 -->
			<!--表示順：14 -->
			<xsl:call-template name="template46" />
		</xsl:for-each>
	</xsl:template>
	<!-- 出願番号 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/com:ApplicationNumber/com:ApplicationNumberText -->
	<xsl:template match="com:ApplicationNumberText" name="template46">
		<div>
			<xsl:text>（２１０）【出願番号】</xsl:text>
			<span data-function="editApplicationNumber" data-size="2">
				<xsl:attribute name="data-value1"><xsl:text>T</xsl:text></xsl:attribute>
				<xsl:attribute name="data-value2"><xsl:value-of select="." /></xsl:attribute>
			</span>
		</div>
	</xsl:template>
	<!-- 出願日グループ -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:NationalApplicationFilingDateBag -->
	<xsl:template match="jptmk:NationalApplicationFilingDateBag"
		name="template47">
		<xsl:for-each select="tmk:NationalApplicationFilingDate">
			<!--出願日 -->
			<!--表示順：15 -->
			<xsl:call-template name="template49" />
		</xsl:for-each>
	</xsl:template>
	<!-- 出願日 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:NationalApplicationFilingDateBag/tmk:NationalApplicationFilingDate -->
	<xsl:template match="tmk:NationalApplicationFilingDate"
		name="template49">
		<div>
			<xsl:text>（２２０）【出願日】</xsl:text>
			<span data-function="convJPdate_fromADToFullChar" data-size="1">
				<xsl:attribute name="data-value1"><xsl:value-of select="." /></xsl:attribute>
			</span>
			<xsl:if test="../jptmk:NationalApplicationFilingIndicator/text()='true'">
				<xsl:text>手続補正書提出の日</xsl:text>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- 特殊出願表示グループ -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:SpecialApplicationIndication -->
	<xsl:template match="jptmk:SpecialApplicationIndication"
		name="template50">

		<xsl:for-each select="jptmk:SpecialApplicationText">
			<!--特殊出願表示 -->
			<!--表示順：16 -->
			<xsl:call-template name="template51" />
		</xsl:for-each>
	</xsl:template>
	<!-- 特殊出願表示 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:SpecialApplicationIndication/jptmk:SpecialApplicationText -->
	<xsl:template match="jptmk:SpecialApplicationText" name="template51">
		<div>
			<xsl:if test="../jptmk:SpecialApplicationCategory='Division'">
				<xsl:text>（６４１）【分割の表示】</xsl:text>
				<span data-function="editApplicationNumber" data-size="2">
					<xsl:attribute name="data-value1">
					<xsl:text>T</xsl:text>
                </xsl:attribute>
					<xsl:attribute name="data-value2">
                    <xsl:value-of select="." />
                </xsl:attribute>
				</span>
				<xsl:text>の分割</xsl:text>
			</xsl:if>
			<xsl:if test="../jptmk:SpecialApplicationCategory='Change'">
				<xsl:text>（６４１）【変更の表示】</xsl:text>
				<span data-function="editApplicationNumber" data-size="2">
					<xsl:attribute name="data-value1">
                    <xsl:text>T</xsl:text>
                </xsl:attribute>
					<xsl:attribute name="data-value2">
                    <xsl:value-of select="." />
                </xsl:attribute>
				</span>
				<xsl:text>の変更</xsl:text>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- 審判番号 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:AppealNumber -->
	<xsl:template match="jptmk:AppealNumber" name="template53">
		<div>
			<xsl:text>【審判番号】</xsl:text>
			<span data-function="editAppealNumber" data-size="2">
				<xsl:attribute name="data-value1"><xsl:text>T</xsl:text></xsl:attribute>
				<xsl:attribute name="data-value2"><xsl:value-of select="." /></xsl:attribute>
			</span>
		</div>
	</xsl:template>
	<!-- 審判請求日 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:AppealDate -->
	<xsl:template match="jptmk:AppealDate" name="template54">
		<div>
			<xsl:text>【審判請求日】</xsl:text>
			<span data-function="convJPdate_fromADToFullChar" data-size="1">
				<xsl:attribute name="data-value1"><xsl:value-of select="." /></xsl:attribute>
			</span>
		</div>
	</xsl:template>
	<!-- パリ条約による優先権等の主張 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:PriorityBag -->
	<xsl:template match="jptmk:PriorityBag" name="template55">

		<xsl:for-each select="jptmk:Priority">
			<!--パリ優先権主張 -->
			<xsl:call-template name="template56" />
		</xsl:for-each>
	</xsl:template>
	<!-- パリ優先権主張 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:PriorityBag/jptmk:Priority -->
	<xsl:template match="jptmk:Priority" name="template56">

		<xsl:for-each select="com:ApplicationNumber">
			<!--出願番号グループ -->
			<xsl:call-template name="template58" />
		</xsl:for-each>
		<xsl:for-each select="com:PriorityApplicationFilingDate">
			<!--出願日 -->
			<!--表示順：20 -->
			<xsl:call-template name="template60" />
		</xsl:for-each>
		<xsl:for-each select="com:PriorityCountryCode">
			<!--国名 -->
			<!--表示順：21 -->
			<xsl:call-template name="template57" />
		</xsl:for-each>
	</xsl:template>
	<!-- 国名 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:PriorityBag/jptmk:Priority/com:PriorityCountryCode -->
	<xsl:template match="com:PriorityCountryCode" name="template57">
		<div>
			<xsl:text>（３３０）【優先権主張国・地域又は機関】</xsl:text>
			<span data-function="getFullNameForCountryToFullChar" data-size="1">
				<xsl:attribute name="data-value1"><xsl:value-of select="." /></xsl:attribute>
			</span>

		</div>

	</xsl:template>
	<!-- 出願番号グループ -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:PriorityBag/jptmk:Priority/com:ApplicationNumber -->
	<xsl:template match="com:ApplicationNumber" name="template58">

		<xsl:for-each select="com:ApplicationNumberText">
			<!--出願番号 -->
			<!--表示順：19 -->
			<xsl:call-template name="template59" />
		</xsl:for-each>
	</xsl:template>
	<!-- 出願番号 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:PriorityBag/jptmk:Priority/com:ApplicationNumber/com:ApplicationNumberText -->
	<xsl:template match="com:ApplicationNumberText" name="template59">
		<div>
			<xsl:text>（３１０）【優先権主張番号】</xsl:text>
			<span data-function="convHalfCharToFullChar" data-size="1">
				<xsl:attribute name="data-value1"><xsl:value-of select="." /></xsl:attribute>
			</span>

		</div>

	</xsl:template>
	<!-- 出願日 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:PriorityBag/jptmk:Priority/com:PriorityApplicationFilingDate -->
	<xsl:template match="com:PriorityApplicationFilingDate"
		name="template60">
		<div>
			<xsl:text>（３２０）【優先日】</xsl:text>
			<span data-function="convJPdate_fromADToFullChar" data-size="1">
				<xsl:attribute name="data-value1"><xsl:value-of select="." /></xsl:attribute>
			</span>

		</div>

	</xsl:template>
	<!-- 商標権者グループ -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:HolderRepresentativeBag -->
	<xsl:template match="jptmk:HolderRepresentativeBag" name="template61">
		<!-- 順不同のため -->
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="name()='jptmk:Holder'">
					<!--商標権者 -->
					<!--表示順：22 -->
					<xsl:call-template name="template62" />
				</xsl:when>
				<xsl:when test="name()='jpcom:Representative'">
					<!--代理人 -->
					<!--表示順：26 -->
					<xsl:call-template name="template71" />
				</xsl:when>
				<xsl:otherwise></xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<!-- 商標権者 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:HolderRepresentativeBag/jptmk:Holder -->
	<xsl:template match="jptmk:Holder" name="template62">
		<div>
			<xsl:text>（７３２）【商標権者】</xsl:text>
		</div>
		<xsl:for-each select="com:PartyIdentifier">
			<!--識別番号 -->
			<!--表示順：17 -->
			<xsl:call-template name="template63" />
		</xsl:for-each>
		<xsl:for-each select="jpcom:Contact/com:Name">
			<!--氏名又は名称-->
			<xsl:call-template name="template66-A" />
		</xsl:for-each>
		<xsl:for-each select="jpcom:Contact/com:Name">
			<!--氏名又は名称(原語)-->
			<xsl:call-template name="template66-B" />
		</xsl:for-each>
		<xsl:for-each select="jpcom:Contact/com:PostalAddressBag">
			<!--住所又は居所 -->
			<xsl:call-template name="template68-A" />
		</xsl:for-each>
		<xsl:for-each select="jpcom:Contact/com:PostalAddressBag">
			<!--住所又は居所(原語) -->
			<xsl:call-template name="template68-B" />
		</xsl:for-each>
	</xsl:template>
	<!-- 識別番号 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:HolderRepresentativeBag/jptmk:Holder/com:PartyIdentifier -->
	<xsl:template match="com:PartyIdentifier" name="template63">
		<div>
			<xsl:text>【識別番号】</xsl:text>
			<span data-function="convHalfCharToFullChar" data-size="1">
				<xsl:attribute name="data-value1"><xsl:value-of select="." /></xsl:attribute>
			</span>

		</div>

	</xsl:template>

	<!-- 組織または人の名前 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:HolderRepresentativeBag/jptmk:Holder/jpcom:Contact/com:Name -->
	<xsl:template match="jpcom:Contact/com:Name" name="template66-A">
		<xsl:choose>
			<xsl:when test="../jpcom:OriginalLanguageIndicator='true'"></xsl:when>
			<xsl:otherwise>
				<xsl:for-each select="com:EntityName">
					<!--氏名又は名称表記 -->
					<!--表示順：24 -->
					<xsl:call-template name="template67-A" />
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- 組織または人の名前 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:HolderRepresentativeBag/jptmk:Holder/jpcom:Contact/com:Name -->
	<xsl:template match="jpcom:Contact/com:Name" name="template66-B">
		<xsl:choose>
			<xsl:when test="../jpcom:OriginalLanguageIndicator='true'">
				<xsl:for-each select="com:EntityName">
					<!--氏名又は名称原語表記 -->
					<!--表示順：24 -->
					<xsl:call-template name="template67-B" />
				</xsl:for-each>
			</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- 氏名又は名称表記 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:HolderRepresentativeBag/jptmk:Holder/jpcom:Contact/com:Name/com:EntityName -->
	<xsl:template match="com:EntityName" name="template67-A">
		<div>
			<xsl:text>【氏名又は名称】</xsl:text>
			<xsl:value-of select="." />
		</div>
	</xsl:template>
	<!-- 氏名又は名称原語表記 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:HolderRepresentativeBag/jptmk:Holder/jpcom:Contact/com:Name/com:EntityName -->
	<xsl:template match="com:EntityName" name="template67-B">
		<div>
			<xsl:text>【氏名又は名称原語表記】</xsl:text>
			<xsl:value-of select="." />
		</div>
	</xsl:template>
	<!-- 郵送先グループ -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:HolderRepresentativeBag/jptmk:Holder/jpcom:Contact/com:PostalAddressBag -->
	<xsl:template match="com:PostalAddressBag" name="template68-A">
		<xsl:choose>
			<xsl:when test="../jpcom:OriginalLanguageIndicator='true'"></xsl:when>
			<xsl:otherwise>
				<xsl:for-each select="com:PostalAddress">
					<!--郵送先 -->
					<xsl:call-template name="template69-A" />
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- 郵送先グループ -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:HolderRepresentativeBag/jptmk:Holder/jpcom:Contact/com:PostalAddressBag -->
	<xsl:template match="com:PostalAddressBag" name="template68-B">
		<xsl:choose>
			<xsl:when test="../jpcom:OriginalLanguageIndicator='true'">
				<xsl:for-each select="com:PostalAddress">
					<!--郵送先 -->
					<xsl:call-template name="template69-B" />
				</xsl:for-each>
			</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- 郵送先 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:HolderRepresentativeBag/jptmk:Holder/jpcom:Contact/com:PostalAddressBag/com:PostalAddress -->
	<xsl:template match="com:PostalAddress" name="template69-A">
		<xsl:for-each select="com:PostalAddressText">
			<!--住所又は居所 -->
			<!--表示順：25 -->
			<xsl:call-template name="template70-A" />
		</xsl:for-each>
	</xsl:template>
	<!-- 郵送先 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:HolderRepresentativeBag/jptmk:Holder/jpcom:Contact/com:PostalAddressBag/com:PostalAddress -->
	<xsl:template match="com:PostalAddress" name="template69-B">
		<xsl:for-each select="com:PostalAddressText">
			<!--住所又は居所原語表記 -->
			<!--表示順：25 -->
			<xsl:call-template name="template70-B" />
		</xsl:for-each>
	</xsl:template>
	<!-- 住所又は居所表記 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:HolderRepresentativeBag/jptmk:Holder/jpcom:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalAddressText -->
	<xsl:template match="com:PostalAddressText" name="template70-A">
		<div>
			<xsl:text>【住所又は居所】</xsl:text>
			<xsl:value-of select="." />
		</div>
	</xsl:template>
	<!-- 住所又は居所原語表記 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:HolderRepresentativeBag/jptmk:Holder/jpcom:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalAddressText -->
	<xsl:template match="com:PostalAddressText" name="template70-B">
		<div>
			<xsl:text>【住所又は居所原語表記】</xsl:text>
			<xsl:value-of select="." />
		</div>
	</xsl:template>
	<!-- 代理人 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:HolderRepresentativeBag/jpcom:Representative -->
	<xsl:template match="jpcom:Representative" name="template71">
		<div>
			<xsl:if test="jpcom:AgentCategory='Representative'">
				<xsl:text>（７４０）【代理人】</xsl:text>
			</xsl:if>
			<xsl:if test="jpcom:AgentCategory='Sub representative'">
				<xsl:text>（７４０）【復代理人】</xsl:text>
			</xsl:if>
			<xsl:if test="jpcom:AgentCategory='Designated representative'">
				<xsl:text>（７４０）【指定代理人】</xsl:text>
			</xsl:if>
		</div>
		<xsl:for-each select="com:PartyIdentifier">
			<!-- 識別番号 -->
			<!--表示順：27 -->
			<xsl:call-template name="template74" />
		</xsl:for-each>
		<xsl:for-each select="com:RepresentativeCategory">
			<!--代理人資格 -->
			<!--表示順：28 -->
			<xsl:call-template name="template73" />
		</xsl:for-each>
		<xsl:for-each select="jpcom:Contact">
			<!--連絡先 -->
			<!--表示順：28 -->
			<xsl:call-template name="template75" />
		</xsl:for-each>
	</xsl:template>
	<!-- 代理人資格 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:HolderRepresentativeBag/jpcom:Representative/com:RepresentativeCategory -->
	<xsl:template match="com:RepresentativeCategory" name="template73">
		<div>
			<xsl:if test="text()='Professional representative'">
				<xsl:text>【弁理士】</xsl:text>
			</xsl:if>
			<xsl:if test="text()='Lawyer'">
				<xsl:text>【弁護士】</xsl:text>
			</xsl:if>
		</div>

	</xsl:template>
	<!-- 識別番号 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:HolderRepresentativeBag/jpcom:Representative/com:PartyIdentifier -->
	<xsl:template match="com:PartyIdentifier" name="template74">
		<div>
			<xsl:text>【識別番号】</xsl:text>
			<span data-function="convHalfCharToFullChar" data-size="1">
				<xsl:attribute name="data-value1"><xsl:value-of select="." /></xsl:attribute>
			</span>

		</div>

	</xsl:template>
	<!-- 連絡先 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:HolderRepresentativeBag/jpcom:Representative/jpcom:Contact -->
	<xsl:template match="jpcom:Contact" name="template75">

		<xsl:for-each select="com:Name">
			<!--組織または人の名前 -->
			<xsl:call-template name="template76" />
		</xsl:for-each>
	</xsl:template>
	<!-- 組織または人の名前 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:HolderRepresentativeBag/jpcom:Representative/jpcom:Contact/com:Name -->
	<xsl:template match="com:Name" name="template76">

		<xsl:for-each select="com:EntityName">
			<!--氏名または名称 -->
			<!--表示順：29 -->
			<xsl:call-template name="template77" />
		</xsl:for-each>
	</xsl:template>
	<!-- 氏名または名称 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:HolderRepresentativeBag/jpcom:Representative/jpcom:Contact/com:Name/com:EntityName -->
	<xsl:template match="com:EntityName" name="template77">
		<div>
			<xsl:text>【氏名又は名称】</xsl:text>
			<xsl:value-of select="." />
		</div>

	</xsl:template>
	<!-- 第３条第２項適用 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:RecognizableGoodsService -->
	<xsl:template match="jptmk:RecognizableGoodsService" name="template78">
		<div>
			<xsl:text>（５２１）【商標法第３条第２項適用】</xsl:text>
		</div>
	</xsl:template>
	<!-- 第９条第１項適用 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:SpecialProvisionConcerningApplicationFilingTime -->
	<xsl:template match="jptmk:SpecialProvisionConcerningApplicationFilingTime"
		name="template80">
		<div>
			<xsl:text>【商標法第９条第１項適用】</xsl:text>
		</div>
	</xsl:template>
	<!-- 第５条第４項適用 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:ColorProvision -->
	<xsl:template match="jptmk:ColorProvision" name="template82">
		<div>
			<xsl:text>（５９１）【商標法第５条色彩に関するただし書適用】</xsl:text>
		<xsl:for-each select="jptmk:ArticleContentText">
			<!--条文内容 -->
			<xsl:call-template name="template84" />
		</xsl:for-each>
		</div>
	</xsl:template>
	<!-- 条文内容 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:ColorProvision/jptmk:ArticleContentText -->
	<xsl:template match="jptmk:ArticleContentText" name="template84">
			<xsl:value-of select="." />
	</xsl:template>
	<!-- 第６８条の３２第１項適用 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:RegistrationRescindException -->
	<xsl:template match="jptmk:RegistrationRescindException"
		name="template85">
		<div>
			<xsl:text>【商標法第６８条の３２第１項適用】</xsl:text>
		<xsl:for-each select="jptmk:ArticleContentText">
			<!--条文内容 -->
			<xsl:call-template name="template87" />
		</xsl:for-each>
		</div>
	</xsl:template>
	<!-- 条文内容 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:RegistrationRescindException/jptmk:ArticleContentText -->
	<xsl:template match="jptmk:ArticleContentText" name="template87">
		<xsl:value-of select="." />
	</xsl:template>
	<!-- 第６８条の３３第１項適用 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:ProtocolDenunciationException -->
	<xsl:template match="jptmk:ProtocolDenunciationException"
		name="template88">
		<div>
			<xsl:text>【商標法第６８条の３３第１項適用】</xsl:text>
		<xsl:for-each select="jptmk:ArticleContentText">
			<!--条文内容 -->
			<xsl:call-template name="template90" />
		</xsl:for-each>
		</div>
	</xsl:template>
	<!-- 条文内容 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:ProtocolDenunciationException/jptmk:ArticleContentText -->
	<xsl:template match="jptmk:ArticleContentText" name="template90">
			<xsl:value-of select="." />
	</xsl:template>
	<!-- 第６８条の３７適用 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:SpecialProvisionConcerningOppositionRegistration -->
	<xsl:template match="jptmk:SpecialProvisionConcerningOppositionRegistration"
		name="template91">
		<div>
			<xsl:text>【商標法第６８条の３７適用】</xsl:text>
			<xsl:for-each select="jptmk:ArticleContentText">
				<!--条文内容 -->
				<xsl:call-template name="template93" />
			</xsl:for-each>
		</div>
	</xsl:template>
	<!-- 条文内容 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:SpecialProvisionConcerningOppositionRegistration/jptmk:ArticleContentText -->
	<xsl:template match="jptmk:ArticleContentText" name="template93">
			<xsl:value-of select="." />
	</xsl:template>
	<!-- 色彩表示 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:ColorIndicationText -->
	<xsl:template match="jptmk:ColorIndicationText" name="template94">
		<div>
			<xsl:text>（５９１）【色彩】</xsl:text>
			<xsl:value-of select="." />
		</div>
	</xsl:template>
	<!-- 早期審査対象出願 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/com:RequestExaminationCategory -->
	<xsl:template match="com:RequestExaminationCategory" name="template95">
		<div>
			<!-- XXX:早期審査対象出願の場合に"Accelerated"を設定する -->
			<xsl:if test="text()='Accelerated'">
				<xsl:text>【早期審査対象出願】</xsl:text>
			</xsl:if>
		</div>

	</xsl:template>
	<!-- 早期審理対象出願 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:RequestAppealTrialExaminationCategory -->
	<xsl:template match="jptmk:RequestAppealTrialExaminationCategory"
		name="template96">
		<div>
			<!-- XXX:早期審理対象出願の場合に"Accelerated"を設定する -->
			<xsl:if test="text()='Accelerated'">
			<xsl:text>【早期審理対象出願】</xsl:text>
			</xsl:if>
		</div>

	</xsl:template>
	<!-- 特例商標 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:SpecialTrademark -->
	<xsl:template match="jptmk:SpecialTrademark" name="template97">
		<div>
			<!-- XXX:特例商標の場合に"Special provision trademark"を設定する 重複商標の場合に"Overlap trademark"を設定する -->
			<xsl:if test="text()='Special provision trademark'">
				<xsl:text>【特例商標】</xsl:text>
			</xsl:if>
			<xsl:if test="text()='Overlap trademark'">
				<xsl:text>【重複商標】</xsl:text>
			</xsl:if>
		</div>

	</xsl:template>
	<!-- 重複する他の出願 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:OverlappedOtherApplication -->
	<xsl:template match="jptmk:OverlappedOtherApplication"
		name="template98">
		<div>
			<xsl:text>（６４１）【重複する他の出願】</xsl:text>
			<span data-function="editOverlappedOtherApplicationNumber"
				data-size="2">
				<xsl:attribute name="data-value1">T</xsl:attribute>
				<xsl:attribute name="data-value2"><xsl:value-of select="." /></xsl:attribute>
			</span>

		</div>

	</xsl:template>
	<!-- 重複する他の登録 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:OverlappedOtherRegistration -->
	<xsl:template match="jptmk:OverlappedOtherRegistration"
		name="template99">
		<div>
			<xsl:text>【重複する他の登録】</xsl:text>
			<xsl:value-of select="." />
		</div>

	</xsl:template>
	<!-- 重複する他の出願（参考情報） -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:OverlappedOtherApplicationReference -->
	<xsl:template match="jptmk:OverlappedOtherApplicationReference"
		name="template100">
		<div>
			<xsl:text>【重複する他の出願（参考情報）】</xsl:text>
			<span data-function="editOverlappedOtherApplicationNumber"
				data-size="2">
				<xsl:attribute name="data-value1">T</xsl:attribute>
				<xsl:attribute name="data-value2"><xsl:value-of select="." /></xsl:attribute>
			</span>

		</div>

	</xsl:template>
	<!-- 法区分 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:DistinctionLaw -->
	<xsl:template match="jptmk:DistinctionLaw" name="template101">
		<div>
			<xsl:text>【法区分】</xsl:text>
			<!-- XXX:｛年号｝○○年改正 -->
			<span data-function="editDistinctionLawYear" data-size="1">
				<xsl:attribute name="data-value1"><xsl:value-of select="." /></xsl:attribute>
			</span>
		</div>

	</xsl:template>
	<!-- 審査官グループ -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:ExaminerBag -->
	<xsl:template match="jptmk:ExaminerBag" name="template102">

		<xsl:for-each select="jptmk:Examiner">
			<!--審査官 -->
			<!--表示順：44 -->
			<xsl:call-template name="template103" />
		</xsl:for-each>
	</xsl:template>
	<!-- 審査官 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:ExaminerBag/jptmk:Examiner -->
	<xsl:template match="jptmk:Examiner" name="template103">
		<div>
			<xsl:text>【審査官】</xsl:text>
			<xsl:for-each select="com:Name">
				<!--組織または人の名前 -->
				<xsl:call-template name="template104" />
			</xsl:for-each>
		</div>
	</xsl:template>
	<!-- 組織または人の名前 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:ExaminerBag/jptmk:Examiner/com:Name -->
	<xsl:template match="com:Name" name="template104">

		<xsl:for-each select="com:PersonName">
			<!--人の名前 -->
			<xsl:call-template name="template105" />
		</xsl:for-each>
	</xsl:template>
	<!-- 人の名前 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:ExaminerBag/jptmk:Examiner/com:Name/com:PersonName -->
	<xsl:template match="com:PersonName" name="template105">

		<xsl:for-each select="com:PersonFullName">
			<!--名前 -->
			<xsl:call-template name="template106" />
		</xsl:for-each>
	</xsl:template>
	<!-- 名前 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:ExaminerBag/jptmk:Examiner/com:Name/com:PersonName/com:PersonFullName -->
	<xsl:template match="com:PersonFullName" name="template106">
		<xsl:value-of select="." />
	</xsl:template>
	<!-- 審判官グループ -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:AppealExaminerBag -->
	<xsl:template match="jptmk:AppealExaminerBag" name="template107">

		<xsl:for-each select="jptmk:ChiefAppealExaminer">
			<!--審判長 -->
			<!--表示順：45 -->
			<xsl:call-template name="template108" />
		</xsl:for-each>
		<xsl:for-each select="jptmk:AppealExaminer">
			<!--審判官 -->
			<!--表示順：46 -->
			<xsl:call-template name="template112" />
		</xsl:for-each>
	</xsl:template>
	<!-- 審判長 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:AppealExaminerBag/jptmk:ChiefAppealExaminer -->
	<xsl:template match="jptmk:ChiefAppealExaminer" name="template108">
		<div>
			<xsl:text>【審判長】【特許庁審判官】</xsl:text>
			<xsl:for-each select="com:Name">
				<!--組織または人の名前 -->
				<xsl:call-template name="template109" />
			</xsl:for-each>
		</div>
	</xsl:template>
	<!-- 組織または人の名前 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:AppealExaminerBag/jptmk:ChiefAppealExaminer/com:Name -->
	<xsl:template match="com:Name" name="template109">

		<xsl:for-each select="com:PersonName">
			<!--人の名前 -->
			<xsl:call-template name="template110" />
		</xsl:for-each>
	</xsl:template>
	<!-- 人の名前 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:AppealExaminerBag/jptmk:ChiefAppealExaminer/com:Name/com:PersonName -->
	<xsl:template match="com:PersonName" name="template110">

		<xsl:for-each select="com:PersonFullName">
			<!--名前 -->
			<xsl:call-template name="template111" />
		</xsl:for-each>
	</xsl:template>
	<!-- 名前 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:AppealExaminerBag/jptmk:ChiefAppealExaminer/com:Name/com:PersonName/com:PersonFullName -->
	<xsl:template match="com:PersonFullName" name="template111">
			<xsl:value-of select="." />
	</xsl:template>
	<!-- 審判官 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:AppealExaminerBag/jptmk:AppealExaminer -->
	<xsl:template match="jptmk:AppealExaminer" name="template112">
		<div>
			<xsl:text> 【特許庁審判官】</xsl:text>
			<xsl:for-each select="com:Name">
				<!--組織または人の名前 -->
				<xsl:call-template name="template113" />
			</xsl:for-each>
		</div>
	</xsl:template>
	<!-- 組織または人の名前 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:AppealExaminerBag/jptmk:AppealExaminer/com:Name -->
	<xsl:template match="com:Name" name="template113">

		<xsl:for-each select="com:PersonName">
			<!--人の名前 -->
			<xsl:call-template name="template114" />
		</xsl:for-each>
	</xsl:template>
	<!-- 人の名前 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:AppealExaminerBag/jptmk:AppealExaminer/com:Name/com:PersonName -->
	<xsl:template match="com:PersonName" name="template114">

		<xsl:for-each select="com:PersonFullName">
			<!--名前 -->
			<xsl:call-template name="template115" />
		</xsl:for-each>
	</xsl:template>
	<!-- 名前 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:AppealExaminerBag/jptmk:AppealExaminer/com:Name/com:PersonName/com:PersonFullName -->
	<xsl:template match="com:PersonFullName" name="template115">
			<xsl:value-of select="." />
	</xsl:template>
	<!-- 称呼データ -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:Pronunciation -->
	<xsl:template match="jptmk:Pronunciation" name="template116">
		<div>
			<xsl:text>（５６１）【称呼（参考情報）】</xsl:text>
			<xsl:value-of select="." />
		</div>

	</xsl:template>
	<!-- 検索用商標 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/tmk:PseudoMarkText -->
	<xsl:template match="tmk:PseudoMarkText" name="template117">
		<div>
			<xsl:text>【検索用文字商標（参考情報）】</xsl:text>
			<xsl:value-of select="." />
		</div>

	</xsl:template>
	<!-- 類似群コードグループ -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:SimilarGroupBag -->
	<xsl:template match="jptmk:SimilarGroupBag" name="template118">
		<div>
			<xsl:text>【類似群コード（参考情報）】</xsl:text>
		</div>
		<xsl:for-each select="jptmk:SimilarGroup">
			<!--類似群 -->
			<xsl:call-template name="template119" />
		</xsl:for-each>
	</xsl:template>
	<!-- 類似群 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:SimilarGroupBag/jptmk:SimilarGroup -->
	<xsl:template match="jptmk:SimilarGroup" name="template119">
		<div>
			<xsl:for-each select="jptmk:SimilarGroupClassification">
				<!--類似群区分 -->
				<xsl:call-template name="template120" />
			</xsl:for-each>
			<xsl:for-each select="jptmk:SimilarGroupCode">
				<!--類似群コード -->
				<xsl:call-template name="template121" />
			</xsl:for-each>
		</div>
	</xsl:template>
	<!-- 類似群区分 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:SimilarGroupBag/jptmk:SimilarGroup/jptmk:SimilarGroupClassification -->
	<xsl:template match="jptmk:SimilarGroupClassification"
		name="template120">
		<!-- XXX:第○○類 -->
		<xsl:text>第</xsl:text>
		<span data-function="convHalfCharToFullChar" data-size="1">
			<xsl:attribute name="data-value1"><xsl:value-of select="." /></xsl:attribute>
		</span>
		<xsl:text>類　</xsl:text>
	</xsl:template>
	<!-- 類似群コード -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:SimilarGroupBag/jptmk:SimilarGroup/jptmk:SimilarGroupCode -->
	<xsl:template match="jptmk:SimilarGroupCode" name="template121">
		<span data-function="replaceString" data-size="1">
			<xsl:attribute name="data-value1"><xsl:value-of select="." /></xsl:attribute>
		</span>
	</xsl:template>
	<!-- ウィーン分類 -->
	<!-- XPATH:/jptmk:RegisteredTrademarkPublication/jptmk:ViennaFigureClassificationText -->
	<xsl:template match="jptmk:ViennaFigureClassificationText"
		name="template122">
		<div>
			<xsl:text>（５３１）【ウィーン分類（参考情報）】</xsl:text>
			<span data-function="convHalfCharToFullChar" data-size="1">
				<xsl:attribute name="data-value1"><xsl:value-of select="." /></xsl:attribute>
			</span>

		</div>

	</xsl:template>
</xsl:transform>
