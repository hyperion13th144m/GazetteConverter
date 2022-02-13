<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt"
    xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common"
    xmlns:jpcom="http://www.jpo.go.jp/standards/XMLSchema/ST96/JPCommon"
    xmlns:tmk="http://www.wipo.int/standards/XMLSchema/ST96/Trademark"
    xmlns:jptmk="http://www.jpo.go.jp/standards/XMLSchema/ST96/JPTrademark"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    exclude-result-prefixes="msxsl"
>
  <xsl:output method="xml" encoding="utf-8" indent="yes"/>

  <xsl:template match="/">
    <xsl:element name="jptmk:RegisteredTrademarkPublication">
      <xsl:attribute name="com:ipoVersion">
        <xsl:value-of select="'JP_V1_0'"/>
      </xsl:attribute>
      <xsl:attribute name="com:st96Version">
        <xsl:value-of select="'V3_1'"/>
      </xsl:attribute>
      <xsl:attribute name="com:languageCode">
        <xsl:value-of select="'ja'"/>
      </xsl:attribute>
      <xsl:attribute name="xsi:schemaLocation">
        <xsl:value-of select="'http://www.jpo.go.jp/standards/XMLSchema/ST96/JPTrademark ../../../../../XSD/JPRegisteredTrademarkPublication_V1_0.xsd'"/>
      </xsl:attribute>
      
      <xsl:apply-templates select="TM-REG-GAZ"/>
    </xsl:element>
  </xsl:template>
  
  <xsl:template match="TM-REG-GAZ">
    <xsl:call-template name="jptmk:Publication"/>
    <xsl:call-template name="jptmk:PlainLanguageDesignationText"/>
    <xsl:apply-templates select="REGISTRATION-DATE"/>
    <xsl:call-template name="jptmk:MarkRepresentation"/>
    <!--
 			
			
			<xsd:element ref="jptmk:GoodsServiceClassNumber" minOccurs="0"/>
			<xsd:element ref="jptmk:GoodsServices" minOccurs="0"/>
			<xsd:element ref="com:ClassificationVersion" minOccurs="0"/>
			<xsd:element ref="jptmk:NiceClassNumberText" minOccurs="0"/>
			<xsd:element ref="com:ApplicationNumber" minOccurs="0"/>
			<xsd:element ref="jptmk:NationalApplicationFilingDateBag"/>
			<xsd:element ref="jptmk:SpecialApplicationIndication" minOccurs="0"/>
			<xsd:element ref="jptmk:AppealNumber" minOccurs="0"/>
			<xsd:element ref="jptmk:AppealDate" minOccurs="0"/>
			<xsd:element ref="jptmk:PriorityBag" minOccurs="0"/>
			<xsd:element ref="jptmk:HolderRepresentativeBag"/>
			<xsd:element ref="jptmk:RecognizableGoodsService" minOccurs="0"/>
			<xsd:element ref="jptmk:SpecialProvisionConcerningApplicationFilingTime" minOccurs="0"/>
			<xsd:element ref="jptmk:ColorProvision" minOccurs="0"/>
			<xsd:element ref="jptmk:RegistrationRescindException" minOccurs="0"/>
			<xsd:element ref="jptmk:ProtocolDenunciationException" minOccurs="0"/>
			<xsd:element ref="jptmk:SpecialProvisionConcerningOppositionRegistration" minOccurs="0"/>
			<xsd:element ref="jptmk:ColorIndicationText" minOccurs="0"/>
			<xsd:element ref="com:RequestExaminationCategory" minOccurs="0"/>
			<xsd:element ref="jptmk:RequestAppealTrialExaminationCategory" minOccurs="0"/>
			<xsd:element ref="jptmk:SpecialTrademark" minOccurs="0" maxOccurs="unbounded"/>
			<xsd:element ref="jptmk:OverlappedOtherApplication" minOccurs="0"/>
			<xsd:element ref="jptmk:OverlappedOtherRegistration" minOccurs="0"/>
			<xsd:element ref="jptmk:OverlappedOtherApplicationReference" minOccurs="0"/>
			<xsd:element ref="jptmk:DistinctionLaw"/>
			<xsd:element ref="jptmk:ExaminerBag" minOccurs="0"/>
			<xsd:element ref="jptmk:AppealExaminerBag" minOccurs="0"/>
			<xsd:element ref="jptmk:Pronunciation" minOccurs="0"/>
			<xsd:element ref="tmk:PseudoMarkText" minOccurs="0"/>
			<xsd:element ref="jptmk:SimilarGroupBag" minOccurs="0"/>
			<xsd:element ref="jptmk:ViennaFigureClassificationText" minOccurs="0"/>
    -->
  </xsl:template>
  
  <xsl:template name="jptmk:Publication">
    <xsl:element name="jptmk:Publication">
      <xsl:apply-templates select="REGISTRATION-NUMBER"/>
      <jptmk:RegistrationNumberKind>Registration</jptmk:RegistrationNumberKind>
      <xsl:apply-templates select="PUBLICATION-DATE"/>
      <com:IPOfficeCode>JP</com:IPOfficeCode>
    </xsl:element>
  </xsl:template>

  <!--登録番号-->
  <xsl:template match="REGISTRATION-NUMBER">
    <xsl:element name="com:PublicationIdentifier">
      <xsl:value-of select="."/>
    </xsl:element>
  </xsl:template>

  <!--公報発行日-->
  <xsl:template match="PUBLICATION-DATE">
    <xsl:element name="com:PublicationDate">
      <xsl:value-of select="."/>
    </xsl:element>
  </xsl:template>

  <!--公報名称(?)-->
  <xsl:template name="jptmk:PlainLanguageDesignationText">
    <xsl:element name="jptmk:PlainLanguageDesignationText">
      <xsl:value-of select="'商標公報'"/>
    </xsl:element>
  </xsl:template>

  <!--登録日 <xsd:element ref="tmk:NationalMarkRegistrationDate" minOccurs="0"/> -->
  <xsl:template match="REGISTRATION-DATE">
    <xsl:if test=".!=''">
      <xsl:element name="tmk:NationalMarkRegistrationDate">
        <xsl:value-of select="."/>
      </xsl:element>
    </xsl:if>
  </xsl:template>

  <!--商標グループ <xsd:element ref="jptmk:MarkRepresentation" minOccurs="0"/>-->
  <xsl:template name="jptmk:MarkRepresentation">
    <xsl:element name="jptmk:MarkRepresentation">
      <xsl:call-template name="jptmk:MarkFeatureCategory"/>
      <xsl:call-template name="jptmk:MarkReproduction"/>
      <xsl:call-template name="jptmk:MarkDescriptionBag"/>
      <xsl:call-template name="jptmk:OptionalMarkDescriptionBag"/>
      <!--
      <xsd:element ref="jptmk:MarkFeatureCategory" minOccurs="0" maxOccurs="unbounded"/>
			<xsd:element ref="jptmk:MarkReproduction"/>
			<xsd:element ref="jptmk:MarkDescriptionBag" minOccurs="0"/>
			<xsd:element ref="jptmk:OptionalMarkDescriptionBag" minOccurs="0"/>
      -->
    </xsl:element>
  </xsl:template>

  <xsl:template name="jptmk:MarkFeatureCategory">
    <xsl:choose>
      <xsl:when test="TD-TRADEMARK-INDICATION[@TD-TRADEMARK-FLAG='TRUE']">
        <!--立体商標-->
        <xsl:call-template name="_MarkFeatureCategory">
          <xsl:with-param name="category" select="'Three dimensional'"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="COLOR-TRADEMARK-INDICATION[@COLOR-TRADEMARK-FLAG='TRUE']">
        <!--色彩のみからなる商標-->
        <xsl:call-template name="_MarkFeatureCategory">
          <xsl:with-param name="category" select="'Colour'"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="SOUND-TRADEMARK-INDICATION[@SOUND-TRADEMARK-FLAG='TRUE']">
        <!--音商標-->
        <xsl:call-template name="_MarkFeatureCategory">
          <xsl:with-param name="category" select="'Sound'"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="HOLOGRAM-DEFENSIVE-MARK-INDICATION[@HOLOGRAM-DEFENSIVE-MARK-FLAG='TRUE']">
        <!--ホログラム商標-->
        <xsl:call-template name="_MarkFeatureCategory">
          <xsl:with-param name="category" select="'Hologram'"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="MOTION-TRADEMARK-INDICATION[@MOTION-TRADEMARK-FLAG='TRUE']">
        <!--動き商標-->
        <xsl:call-template name="_MarkFeatureCategory">
          <xsl:with-param name="category" select="'Motion'"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="POSITION-TRADEMARK-INDICATION[@POSITION-TRADEMARK-FLAG='TRUE']">
        <!--位置商標-->
        <xsl:call-template name="_MarkFeatureCategory">
          <xsl:with-param name="category" select="'Position'"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="OTHER-TRADEMARK-INDICATION[@OTHER-TRADEMARK-FLAG='TRUE']">
        <!--その他の商標-->
        <xsl:call-template name="_MarkFeatureCategory">
          <xsl:with-param name="category" select="'Other'"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="COLLECTIVE-TRADEMARK-INDICATION[@COLLECTIVE-TRADEMARK-FLAG='TRUE']">
        <!--団体商標-->
        <xsl:call-template name="_MarkFeatureCategory">
          <xsl:with-param name="category" select="'Collective'"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="REGIONAL-TRADEMARK-INDICATION[@REGIONAL-TRADEMARK-FLAG='TRUE']">
        <!--地域団体商標-->
        <xsl:call-template name="_MarkFeatureCategory">
          <xsl:with-param name="category" select="'Regional'"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise/>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template name="_MarkFeatureCategory">
    <xsl:param name="category"/>
    <xsl:element name="jptmk:MarkFeatureCategory">
      <xsl:value-of select="$category"/>
    </xsl:element>
  </xsl:template>

  <xsl:template name="jptmk:MarkReproduction">
    <xsl:call-template name="jptmk:MarkCategory"/>
    <!--
		  <xsd:sequence>
			  <xsd:element ref="jptmk:MarkCategory" minOccurs="0"/>
			  <xsd:choice maxOccurs="unbounded">
				  <xsd:element ref="tmk:WordMarkSpecification"/>
				  <xsd:element ref="tmk:MarkImageBag"/>
				  <xsd:element ref="jptmk:MarkSoundBag"/>
				  <xsd:element ref="tmk:MarkMultimediaBag"/>
			  </xsd:choice>
		  </xsd:sequence>
    -->
  </xsl:template>
  
  <xsl:template name="jptmk:MarkCategory">
    <xsl:choose>
      <xsl:when test="TRADEMARK[@KIND-OF-TRADEMARK='TRADEMARK']">
        <!--登録商標-->
        <xsl:call-template name="_MarkCategory">
          <xsl:with-param name="category" select="'Trademark'"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="TRADEMARK[@KIND-OF-TRADEMARK='DEFENSIVE-MARK']">
        <!--登録防護標章-->
        <xsl:call-template name="_MarkCategory">
          <xsl:with-param name="category" select="'Defensive mark'"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="TRADEMARK[@KIND-OF-TRADEMARK='CHARACTER']">
        <!--登録商標（標準文字）-->
        <xsl:call-template name="_MarkCategory">
          <xsl:with-param name="category" select="'Word'"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="TRADEMARK[@KIND-OF-TRADEMARK='DEFENSIVE-CHARACTER']">
        <!--登録防護標章（標準文字）-->
        <xsl:call-template name="_MarkCategory">
          <xsl:with-param name="category" select="'Defensive word'"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise/>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="_MarkCategory">
    <xsl:param name="category"/>
    <xsl:element name="jptmk:MarkCategory">
      <xsl:value-of select="$category"/>
    </xsl:element>
  </xsl:template>

  <xsl:template name="jptmk:MarkDescriptionBag">
    
  </xsl:template>

  <xsl:template name="jptmk:OptionalMarkDescriptionBag">

  </xsl:template>

  <xsl:template match="@* | node()">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
  </xsl:template>
</xsl:stylesheet>
