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
    <jptmk:RegisteredTrademarkPublication
      xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common"
      xmlns:jpcom="http://www.jpo.go.jp/standards/XMLSchema/ST96/JPCommon"
      xmlns:tmk="http://www.wipo.int/standards/XMLSchema/ST96/Trademark"
      xmlns:jptmk="http://www.jpo.go.jp/standards/XMLSchema/ST96/JPTrademark"
      com:ipoVersion="JP_V1_0" com:st96Version="V3_1" com:languageCode="ja">
      <xsl:apply-templates select="TM-REG-GAZ"/>
    </jptmk:RegisteredTrademarkPublication>
  </xsl:template>
  
  <xsl:template match="TM-REG-GAZ">
    <xsl:call-template name="template_005"/>
    <xsl:call-template name="template_010"/>
    <xsl:call-template name="template_011"/>
    <xsl:call-template name="template_012"/>
    <xsl:call-template name="template_031"/>
    <xsl:call-template name="template_032"/>
    <xsl:call-template name="template_038"/>
    <xsl:call-template name="template_039"/>
    <xsl:call-template name="template_040"/>
    <xsl:call-template name="template_042"/>
    <xsl:call-template name="template_045"/>
    <xsl:call-template name="template_048"/>
    <xsl:call-template name="template_049"/>
    <xsl:call-template name="template_050"/>
    <xsl:call-template name="template_056"/>
    <xsl:call-template name="template_073"/>
    <xsl:call-template name="template_075"/>
    <xsl:call-template name="template_077"/>
    <xsl:call-template name="template_080"/>
    <xsl:call-template name="template_083"/>
    <xsl:call-template name="template_086"/>
    <xsl:call-template name="template_089"/>
    <xsl:call-template name="template_090"/>
    <xsl:call-template name="template_091"/>
    <xsl:call-template name="template_092"/>
    <xsl:call-template name="template_093"/>
    <xsl:call-template name="template_094"/>
    <xsl:call-template name="template_095"/>
    <xsl:call-template name="template_096"/>
    <xsl:call-template name="template_097"/>
    <xsl:call-template name="template_102"/>
    <xsl:call-template name="template_111"/>
    <xsl:call-template name="template_112"/>
    <xsl:call-template name="template_113"/>
    <xsl:call-template name="template_117"/>
  </xsl:template>

  <!--公報-->
  <xsl:template name="template_005">
    <xsl:element name="jptmk:Publication">
      <xsl:call-template name="template_006"/>
      <xsl:call-template name="template_007"/>
      <xsl:call-template name="template_008"/>
      <xsl:call-template name="template_009"/>
    </xsl:element>
  </xsl:template>

  <!--登録番号-->
  <xsl:template name="template_006">
    <xsl:element name="com:PublicationIdentifier">
      <xsl:value-of select="REGISTRATION-NUMBER"/>
    </xsl:element>
  </xsl:template>

  <!--種別-->
  <xsl:template name="template_007">
    <xsl:variable name="tmp" select="REGISTRATION-NUMBER/@KIND-OF-REGISTRATION-NUMBER"/>
    <xsl:variable name="kind">
      <xsl:choose>
        <xsl:when test="$tmp='REGISTRATION'">
          <xsl:value-of select="'Registration'"/>
        </xsl:when>
        <xsl:when test="$tmp='DIVISION'">
          <xsl:value-of select="'Division'"/>
        </xsl:when>
        <xsl:when test="$tmp='PROTECTION'">
          <xsl:value-of select="'Protection'"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="''"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:if test="string-length($kind) &gt; 0">
      <xsl:element name="jptmk:RegistrationNumberKind">
        <xsl:value-of select="$kind"/>
      </xsl:element>
    </xsl:if>
  </xsl:template>
  
  <!--公報発行日-->
  <xsl:template name="template_008">
    <xsl:if test="PUBLICATION-DATE">
      <xsl:element name="com:PublicationDate">
        <xsl:value-of select="PUBLICATION-DATE"/>
      </xsl:element>
    </xsl:if>
  </xsl:template>

  <!--発行国-->
  <xsl:template name="template_009">
    <xsl:if test="PUBLICATION-COUNTRY">
      <xsl:element name="com:IPOfficeCode">
        <!--JP 固定だが、いちおうSGMLから持ってくる-->
        <xsl:value-of select="PUBLICATION-COUNTRY"/>
      </xsl:element>
    </xsl:if>
  </xsl:template>

  <!--公報種別-->
  <xsl:template name="template_010">
    <xsl:element name="jptmk:PlainLanguageDesignationText">
      <xsl:value-of select="KIND-OF-OFFICIAL-GAZETTE"/>
    </xsl:element>
  </xsl:template>

  <!--登録日-->
  <xsl:template name="template_011">
    <xsl:if test="REGISTRATION-DATE">
      <xsl:element name="tmk:NationalMarkRegistrationDate">
        <xsl:value-of select="REGISTRATION-DATE"/>
      </xsl:element>
    </xsl:if>
  </xsl:template>

  <!--商標グループ-->
  <xsl:template name="template_012">
    <!-- min occur = 0 だが、1と仮定して処理する。-->
    <xsl:element name="jptmk:MarkRepresentation">
      <xsl:call-template name="template_013"/>
      <xsl:call-template name="template_014"/>
      <xsl:call-template name="template_029"/>
    </xsl:element>
  </xsl:template>

  <!--商標の特性種別-->
  <xsl:template name="template_013">
    <xsl:variable name="category">
      <xsl:choose>
        <xsl:when test="TD-TRADEMARK-INDICATION[@TD-TRADEMARK-FLAG='TRUE']">
          <!--立体商標-->
          <xsl:value-of select="'Three dimensional'"/>
        </xsl:when>
        <xsl:when test="COLOR-TRADEMARK-INDICATION[@COLOR-TRADEMARK-FLAG='TRUE']">
          <!--色彩のみからなる商標-->
            <xsl:value-of select="'Colour'"/>
        </xsl:when>
        <xsl:when test="SOUND-TRADEMARK-INDICATION[@SOUND-TRADEMARK-FLAG='TRUE']">
          <!--音商標-->
            <xsl:value-of select="'Sound'"/>
        </xsl:when>
        <xsl:when test="HOLOGRAM-TRADEMARK-INDICATION[@HOLOGRAM-TRADEMARK-FLAG='TRUE']">
          <!--ホログラム商標-->
            <xsl:value-of select="'Hologram'"/>
        </xsl:when>
        <xsl:when test="MOTION-TRADEMARK-INDICATION[@MOTION-TRADEMARK-FLAG='TRUE']">
          <!--動き商標-->
            <xsl:value-of select="'Motion'"/>
        </xsl:when>
        <xsl:when test="POSITION-TRADEMARK-INDICATION[@POSITION-TRADEMARK-FLAG='TRUE']">
          <!--位置商標-->
            <xsl:value-of select="'Position'"/>
        </xsl:when>
        <xsl:when test="OTHER-TRADEMARK-INDICATION[@OTHER-TRADEMARK-FLAG='TRUE']">
          <!--その他の商標-->
            <xsl:value-of select="'Other'"/>
        </xsl:when>
        <xsl:when test="COLLECTIVE-TRADEMARK-INDICATION[@COLLECTIVE-TRADEMARK-FLAG='TRUE']">
          <!--団体商標-->
            <xsl:value-of select="'Collective'"/>
        </xsl:when>
        <xsl:when test="REGIONAL-TRADEMARK-INDICATION[@REGIONAL-TRADEMARK-FLAG='TRUE']">
          <!--地域団体商標-->
            <xsl:value-of select="'Regional'"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="''"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:if test="string-length($category) &gt; 0">
      <xsl:element name="jptmk:MarkFeatureCategory">
        <xsl:value-of select="$category"/>
      </xsl:element>
    </xsl:if>
  </xsl:template>

  <!--商標-->
  <xsl:template name="template_014">
    <xsl:element name="jptmk:MarkRepresentation">
      <xsl:call-template name="template_015"/>
      <xsl:call-template name="template_016"/>
      <xsl:call-template name="template_018"/>
      <xsl:call-template name="template_025"/>
    </xsl:element>
  </xsl:template>

  <!--種別-->
  <xsl:template name="template_015">
    <xsl:variable name="tmp" select="TRADEMARK/@KIND-OF-TRADEMARK"/>
    <xsl:variable name="kind">
      <xsl:choose>
        <xsl:when test="$tmp='TRADEMARK'">
          <!--登録商標-->
          <xsl:value-of select="'Trademark'"/>
        </xsl:when>
        <xsl:when test="$tmp='DEFENSIVE-MARK'">
          <!--登録防護標章-->
          <xsl:value-of select="'Defensive mark'"/>
        </xsl:when>
        <xsl:when test="$tmp='CHARACTER'">
          <!--登録商標（標準文字）-->
          <xsl:value-of select="'Word'"/>
        </xsl:when>
        <xsl:when test="$tmp='DEFENSIVE-CHARACTER'">
          <!--登録防護標章（標準文字）-->
          <xsl:value-of select="'Defensive word'"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="''"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:if test="string-length($kind) &gt; 0">
      <xsl:element name="jptmk:MarkCategory">
        <xsl:value-of select="$kind"/>
      </xsl:element>
    </xsl:if>
  </xsl:template>

  <!--文字グループ/文字-->
  <xsl:template name="template_016">
    <xsl:for-each select="TRADEMARK/CHARACTER">
      <xsl:element name="tmk:WordMarkSpecification">
        <xsl:element name="tmk:MarkSignificantVerbalElementText">
          <xsl:value-of select="."/>
        </xsl:element>
      </xsl:element>
    </xsl:for-each>
  </xsl:template>

  <!--イメージグループ/イメージ-->
  <xsl:template name="template_018">
    <xsl:for-each select="TRADEMARK/IMAGE">
      <xsl:element name="tmk:MarkImageBag">
        <xsl:element name="tmk:MarkImage">
          <xsl:element name="com:FileName">
            <xsl:value-of select="./@FILE-ID"/>
          </xsl:element>
          <xsl:element name="com:HeightMeasure">
            <xsl:attribute name="com:measureUnitCode">Mm</xsl:attribute>
            <!-- 80mm固定だとまずいかも-->
            <xsl:value-of select="'80'"/>
          </xsl:element>
          <xsl:element name="com:WidthMeasure">
            <xsl:attribute name="com:measureUnitCode">Mm</xsl:attribute>
            <!-- 80mm固定だとまずいかも-->
            <xsl:value-of select="'80'"/>
          </xsl:element>
        </xsl:element>
      </xsl:element>
    </xsl:for-each>
  </xsl:template>

  <!--音声グループ/音声データ-->
  <xsl:template name="template_025">
    <xsl:for-each select="TRADEMARK/SOUND">
      <xsl:element name="jptmk:MarkSoundBag">
        <xsl:element name="tmk:MarkSound">
          <xsl:element name="com:FileName">
            <xsl:value-of select="./@FILE-NAME"/>
          </xsl:element>
          <xsl:element name="jptmk:MarkSoundText">
            <xsl:value-of select="../SOUND-FILE"/>
          </xsl:element>
        </xsl:element>
      </xsl:element>
    </xsl:for-each>
  </xsl:template>

  <!--商標の詳細な説明グループ-->
  <xsl:template name="template_029">
    <xsl:variable name="detail">
      <xsl:choose>
        <xsl:when test="TRADEMARK/DETAIL-EXPLANATION-OF-THE-TRADEMARK">
          <xsl:value-of select="TRADEMARK/DETAIL-EXPLANATION-OF-THE-TRADEMARK"/>
        </xsl:when>
        <xsl:when test="TRADEMARK/DETAIL-EXPLANATION-OF-THE-DEFENSIVE-MARK">
          <xsl:value-of select="TRADEMARK/DETAIL-EXPLANATION-OF-THE-DEFENSIVE-MARK"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="''"/>
        </xsl:otherwise>
      </xsl:choose>      
    </xsl:variable>
    <xsl:if test="string-length($detail) &gt; 0">
      <xsl:element name="jptmk:MarkDescriptionBag">
        <xsl:element name="jptmk:MarkDescriptionText">
          <xsl:value-of select="$detail"/>
        </xsl:element>
      </xsl:element>
    </xsl:if>
  </xsl:template>

  <!--商品・役務の区分の数-->
  <xsl:template name="template_031">
    <xsl:if test="string-length(NUMBER-OF-GOODS-SERVICE-CLASS) &gt; 0">
      <xsl:element name="jptmk:GoodsServiceClassNumber">
        <xsl:value-of select="NUMBER-OF-GOODS-SERVICE-CLASS"/>
      </xsl:element>
    </xsl:if>
  </xsl:template>

  <!--商品・役務-->
  <xsl:template name="template_032">
    <xsl:if test="count(CLASS-OF-GOODS-AND-SERVICE) &gt; 0">
      <xsl:element name="jptmk:GoodsServices">
        <xsl:call-template name="template_033"/>
        <xsl:call-template name="template_034"/>
      </xsl:element>
    </xsl:if>
  </xsl:template>

  <!--商品・役務の区分並びに指定商品・役務-->
  <xsl:template name="template_033">
    <xsl:if test="string-length(CLASS-OF-GOODS-AND-SERVICE/@CLASSIFICATION) &gt; 0">
      <xsl:element name="tmk:ClassificationKindCode">
        <xsl:if test="CLASS-OF-GOODS-AND-SERVICE/@CLASSIFICATION='INTERNATIONAL'">
          <xsl:value-of select="'Nice'"/>
        </xsl:if>
        <xsl:if test="CLASS-OF-GOODS-AND-SERVICE/@CLASSIFICATION='JAPANESE'">
          <xsl:value-of select="'Domestic'"/>
        </xsl:if>
      </xsl:element>
    </xsl:if>
  </xsl:template>

  <!--商品役務並びに区分グループ-->
  <xsl:template name="template_034">
    <xsl:element name="jptmk:ClassDescriptionBag">
      <xsl:for-each select="CLASS-OF-GOODS-AND-SERVICE/GOODS-AND-SERVICE-CLASS-GROUP">
        <xsl:element name="jptmk:ClassDescription">
          <xsl:element name="tmk:ClassNumber">
            <xsl:value-of select="CLASS"/>
          </xsl:element>
          <xsl:element name="tmk:GoodsServicesDescriptionText">
            <xsl:value-of select="GOODS-AND-SERVICE"/>
          </xsl:element>
        </xsl:element>
      </xsl:for-each>
    </xsl:element>
  </xsl:template>

  <!--国際分類版表示-->
  <xsl:template name="template_038">
    <xsl:if test="string-length(VERSION-OF-NICE-CLASS/@VERSION) &gt; 0">
      <xsl:element name="com:ClassificationVersion">
        <xsl:value-of select="VERSION-OF-NICE-CLASS/@VERSION"/>
      </xsl:element>
    </xsl:if>
  </xsl:template>

  <!--国際分類-->
  <xsl:template name="template_039">
    <xsl:if test="string-length(NICE-CLASS) &gt; 0">
      <xsl:element name="jptmk:NiceClassNumberText">
        <xsl:value-of select="NICE-CLASS"/>
      </xsl:element>
    </xsl:if>
  </xsl:template>

  <!--出願番号グループ/出願番号-->
  <xsl:template name="template_040">
    <xsl:if test="string-length(APPLICATION-NUMBER) &gt; 0">
      <xsl:element name="com:ApplicationNumber">
        <xsl:element name="com:ApplicationNumberText">
          <xsl:value-of select="APPLICATION-NUMBER"/>
        </xsl:element>
      </xsl:element>
    </xsl:if>
  </xsl:template>

  <!--出願日グループ-->
  <xsl:template name="template_042">
    <xsl:element name="jptmk:NationalApplicationFilingDateBag">
      <xsl:if test="count(WRITTEN-AMENDMENT) &gt; 0">
        <!--TR.CSV には WRITTEN-AMENDMENT は存在しない。TROCOR.CSVに存在する。
              TR.CSVで定義されるTM-REG-GAZをXMLに変換するこのXSLTでは不要だけど、
              含めておいた。
          -->
        <xsl:element name="jptmk:NationalApplicationFilingIndicator">true</xsl:element>
      </xsl:if>
      <xsl:element name="tmk:NationalApplicationFilingDate">
        <xsl:value-of select="FILING-DATE"/>
      </xsl:element>
    </xsl:element>
  </xsl:template>
    
  <!--特殊出願表示グループ-->
  <xsl:template name="template_045">
    <xsl:if test="count(SPECIAL-APPLICATION-INDICATION) &gt; 0">
      <xsl:element name="jptmk:SpecialApplicationIndication">
        <xsl:element name="jptmk:SpecialApplicationText">
          <xsl:value-of select="SPECIAL-APPLICATION-INDICATION"/>
        </xsl:element>
        <xsl:element name="jptmk:SpecialApplicationCategory">
          <xsl:choose>
            <xsl:when test="SPECIAL-APPLICATION-INDICATION[@KIND-OF-APPLICATION-INDICATION='DIVISION']">
              <xsl:value-of select="'Division'"/>
            </xsl:when>
            <xsl:when test="SPECIAL-APPLICATION-INDICATION[@KIND-OF-APPLICATION-INDICATION='CHANGE']">
              <xsl:value-of select="'Change'"/>
            </xsl:when>
          </xsl:choose>
        </xsl:element>
      </xsl:element>
    </xsl:if>
  </xsl:template>

  <!--審判番号-->
  <xsl:template name="template_048">
    <xsl:if test="count(APPEAL-NUMBER) &gt; 0">
      <xsl:element name="jptmk:AppealNumber">
        <xsl:value-of select="APPEAL-NUMBER"/>
      </xsl:element>
    </xsl:if>
  </xsl:template>

  <!--審判請求日-->
  <xsl:template name="template_049">
    <xsl:if test="count(APPEAL-DATE) &gt; 0">
      <xsl:element name="jptmk:AppealDate">
        <xsl:value-of select="APPEAL-DATE"/>
      </xsl:element>
    </xsl:if>
  </xsl:template>

  <!--パリ条約による優先権等の主張-->
  <xsl:template name="template_050">
    <xsl:if test="count(PARIS-PRIORITY-CLAIM-ARTICLE) &gt; 0">
      <xsl:element name="jptmk:PriorityBag">
        <xsl:for-each select="PARIS-PRIORITY-CLAIM-ARTICLE/PARIS-PRIORITY-GROUP">
          <xsl:element name="jptmk:Priority">
            <xsl:element name="com:PriorityCountryCode">
              <xsl:value-of select="NATION"/>
            </xsl:element>
            <xsl:element name="com:ApplicationNumber">
              <xsl:element name="com:ApplicationNumberText">
                <xsl:value-of select="APPLICATION-NUMBER"/>
              </xsl:element>
            </xsl:element>
            <xsl:element name="com:PriorityApplicationFilingDate">
              <xsl:value-of select="FILING-DATE"/>
            </xsl:element>
          </xsl:element>
        </xsl:for-each>
      </xsl:element>
    </xsl:if>
  </xsl:template>

  <!--商標権者グループ-->
  <xsl:template name="template_056">
    <xsl:element name="jptmk:HolderRepresentativeBag">
      <xsl:call-template name="template_057"/>
      <xsl:call-template name="template_066"/>
    </xsl:element>
  </xsl:template>

  <!--商標権者-->
  <xsl:template name="template_057">
    <xsl:for-each select="RIGHT-HOLDER-GROUP/RIGHT-HOLDER">
      <xsl:element name="jptmk:Holder">
        <xsl:element name="com:PartyIdentifier">
          <xsl:value-of select="IDENTIFICATION-NUMBER"/>        
        </xsl:element>
        <xsl:element name="jpcom:Contact">
          <xsl:choose>
            <xsl:when test="count(ORIGINAL-NAME) &gt; 0">
              <xsl:element name="jpcom:OriginalLanguageIndicator">true</xsl:element>
              <xsl:element name="com:Name">
                <xsl:element name="com:EntityName">
                  <xsl:value-of select="ORIGINAL-NAME"/>
                </xsl:element>
              </xsl:element>
            </xsl:when>
            <xsl:otherwise>
              <xsl:element name="com:Name">
                <xsl:element name="com:EntityName">
                  <xsl:value-of select="NAME"/>
                </xsl:element>
              </xsl:element>
            </xsl:otherwise>
          </xsl:choose>
          <xsl:choose>
            <xsl:when test="count(ORIGINAL-ADDRESS) &gt; 0">
              <xsl:element name="jpcom:OriginalLanguageIndicator">true</xsl:element>
              <xsl:element name="com:PostalAddressBag">
                <xsl:element name="com:PostalAddress">
                  <xsl:element name="com:PostalAddressText">
                    <xsl:value-of select="ORIGINAL-ADDRESS"/>
                  </xsl:element>
                </xsl:element>
              </xsl:element>
            </xsl:when>
            <xsl:otherwise>
              <xsl:element name="com:PostalAddressBag">
                <xsl:element name="com:PostalAddress">
                  <xsl:element name="com:PostalAddressText">
                    <xsl:value-of select="ADDRESS"/>
                  </xsl:element>
                </xsl:element>
              </xsl:element>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:element>
      </xsl:element>
    </xsl:for-each>
  </xsl:template>

  <!--代理人-->
  <xsl:template name="template_066">
    <xsl:for-each select="RIGHT-HOLDER-GROUP/PROXY">
      <xsl:element name="jpcom:Representative">
        <xsl:element name="jpcom:AgentCategory">
          <xsl:choose>
            <xsl:when test="self::node()[@KIND-OF-ATTORNEY='REPRESENTATIVE']">
              <xsl:value-of select="'Representative'"/>
            </xsl:when>
            <xsl:when test="self::node()[@KIND-OF-ATTORNEY='SUB-REPRESENTATIVE']">
              <xsl:value-of select="'Sub representative'"/>
            </xsl:when>
            <xsl:when test="self::node()[@KIND-OF-ATTORNEY='LEGAL-REPRESENTATIVE']">
              <!-- XML 第1版では、Legal representative は存在しない。とりあえず、コピー-->
              <xsl:value-of select="'Legal representative'"/>
            </xsl:when>
            <xsl:when test="self::node()[@KIND-OF-ATTORNEY='DESIGNATED-REPRESENTATIVE']">
              <xsl:value-of select="'Designated representative'"/>
            </xsl:when>
          </xsl:choose>
        </xsl:element>
        <xsl:element name="com:RepresentativeCategory">
          <xsl:choose>
            <xsl:when test="ATTORNEY-RIGHT[@KIND-OF-ATTORNEY-RIGHT='PATENT-ATTORNEY']">
              <xsl:value-of select="'Professional representative'"/>
            </xsl:when>
            <xsl:when test="ATTORNEY-RIGHT[@KIND-OF-ATTORNEY-RIGHT='ATTORNEY-AT-LAW']">
              <xsl:value-of select="'Lawyer'"/>
            </xsl:when>
          </xsl:choose>
        </xsl:element>
        <xsl:element name="com:PartyIdentifier">
          <xsl:value-of select="IDENTIFICATION-NUMBER"/>
        </xsl:element>
        <xsl:element name="jpcom:Contact">
          <xsl:element name="com:Name">
            <xsl:element name="com:EntityName">
              <xsl:value-of select="NAME"/>
            </xsl:element>
          </xsl:element>
        </xsl:element>
      </xsl:element>
    </xsl:for-each>
  </xsl:template>

  <!--第３条第２項適用-->
  <xsl:template name="template_073">
    <xsl:if test="TRADEMARK-LAW-SEC-3-2-APPLIED[@TRADEMARK-LAW-SEC-3-2-FLAG='TRUE']">
      <xsl:element name="jptmk:RecognizableGoodsService">
        <xsl:element name="jptmk:ArticleNameText">
          <xsl:value-of select="TRADEMARK-LAW-SEC-3-2-APPLIED"/>
        </xsl:element>
      </xsl:element>
    </xsl:if>
  </xsl:template>
  
  <!--第９条第１項適用-->
  <xsl:template name="template_075">
    <xsl:if test="TRADEMARK-LAW-SEC-9-1-APPLIED[@TRADEMARK-LAW-SEC-9-1-FLAG='TRUE']">
      <xsl:element name="jptmk:SpecialProvisionConcerningApplicationFilingTime">
        <xsl:element name="jptmk:ArticleNameText">
          <xsl:value-of select="TRADEMARK-LAW-SEC-9-1-APPLIED"/>
        </xsl:element>
      </xsl:element>
    </xsl:if>
  </xsl:template>
  
  <!--第５条第４項適用-->
  <xsl:template name="template_077">
    <xsl:if test="TRADEMARK-LAW-SEC-5-4-APPLIED[@TRADEMARK-LAW-SEC-5-4-FLAG='TRUE']">
      <xsl:element name="jptmk:ColorProvision">
        <xsl:element name="jptmk:ArticleContentText">
          <xsl:value-of select="TRADEMARK-LAW-SEC-5-4-APPLIED"/>
        </xsl:element>
      </xsl:element>
    </xsl:if>
  </xsl:template>
  
  <!--第６８条の３２第１項適用-->
  <xsl:template name="template_080">
    <xsl:if test="TRADEMARK-LAW-SEC-68-32-1-APPLIED[@TRADEMARK-LAW-SEC-68-32-1-FLAG='TRUE']">
      <xsl:element name="jptmk:RegistrationRescindException">
        <xsl:element name="jptmk:ArticleContentText">
          <xsl:value-of select="TRADEMARK-LAW-SEC-68-32-1-APPLIED"/>
        </xsl:element>
      </xsl:element>
    </xsl:if>
  </xsl:template>
  
  <!--第６８条の３３第１項適用-->
  <xsl:template name="template_083">
    <xsl:if test="TRADEMARK-LAW-SEC-68-33-1-APPLIED[@TRADEMARK-LAW-SEC-68-33-1-FLAG='TRUE']">
      <xsl:element name="jptmk:ProtocolDenunciationException">
        <xsl:element name="jptmk:ArticleContentText">
          <xsl:value-of select="TRADEMARK-LAW-SEC-68-33-1-APPLIED"/>
        </xsl:element>
      </xsl:element>
    </xsl:if>
  </xsl:template>
  
  <!--第６８条の３７適用-->
  <xsl:template name="template_086">
    <xsl:if test="TRADEMARK-LAW-SEC-68-37-APPLIED[@TRADEMARK-LAW-SEC-68-37-FLAG='TRUE']">
      <xsl:element name="jptmk:SpecialProvisionConcerningOppositionRegistration">
        <xsl:element name="jptmk:ArticleContentText">
          <xsl:value-of select="TRADEMARK-LAW-SEC-68-37-APPLIED"/>
        </xsl:element>
      </xsl:element>
    </xsl:if>
  </xsl:template>
  
  <!--色彩表示-->
  <xsl:template name="template_089">
    <xsl:if test="count(COLOR-INDICATION) &gt; 0">
      <xsl:element name="jptmk:ColorIndicationText">
        <xsl:value-of select="COLOR-INDICATION"/>
      </xsl:element>
    </xsl:if>
  </xsl:template>
    
  <!--早期審査対象出願-->
  <xsl:template name="template_090">
    <xsl:if test="OBJECT-APPLICATION[@KIND-OF-OBJECT-APPLICATION='ACCELERATED-EXAM']">
      <xsl:element name="com:RequestExaminationCategory">
        <xsl:value-of select="'Accelerated'"/>
      </xsl:element>
    </xsl:if>
  </xsl:template>

  <!--早期審理対象出願-->
  <xsl:template name="template_091">
    <xsl:if test="OBJECT-APPLICATION[@KIND-OF-OBJECT-APPLICATION='ACCELERATED-APPEAL-EXAM']">
      <xsl:element name="jptmk:RequestAppealTrialExaminationCategory">
        <xsl:value-of select="'Accelerated'"/>
      </xsl:element>
    </xsl:if>
  </xsl:template>
  
  <!--特例商標-->
  <xsl:template name="template_092">
    <xsl:if test="SPECIAL-TRADEMARK[@KIND-OF-SPECIAL-TRADEMARK='SPECIAL-PROVISION-TRADEMARK']">
      <xsl:element name="jptmk:SpecialTrademark">
        <xsl:value-of select="'Special provision trademark'"/>
      </xsl:element>
    </xsl:if>
    <xsl:if test="SPECIAL-TRADEMARK[@KIND-OF-SPECIAL-TRADEMARK='OVERLAP-TRADEMARK']">
      <xsl:element name="jptmk:SpecialTrademark">
        <xsl:value-of select="'Overlap trademark'"/>
      </xsl:element>
    </xsl:if>
  </xsl:template>
  
  <!--重複する他の出願-->
  <xsl:template name="template_093">
    <xsl:if test="count(OVERLAPPED-OTHER-APPLICATION) &gt; 0">
      <xsl:element name="jptmk:OverlappedOtherApplication">
        <xsl:value-of select="OVERLAPPED-OTHER-APPLICATION"/>
      </xsl:element>
    </xsl:if>
  </xsl:template>

  <!--重複する他の登録-->
  <xsl:template name="template_094">
    <xsl:if test="count(OVERLAPPED-OTHER-REGISTRATION) &gt; 0">
      <xsl:element name="jptmk:OverlappedOtherRegistration">
        <xsl:value-of select="OVERLAPPED-OTHER-REGISTRATION"/>
      </xsl:element>
    </xsl:if>
  </xsl:template>

  <!--重複する他の出願（参考情報）-->
  <xsl:template name="template_095">
    <xsl:if test="count(OVERLAPPED-OTHER-APPLICATION-REF) &gt; 0">
      <xsl:element name="jptmk:OverlappedOtherApplicationReference">
        <xsl:value-of select="OVERLAPPED-OTHER-APPLICATION-REF"/>
      </xsl:element>
    </xsl:if>
  </xsl:template>

  <!--法区分-->
  <xsl:template name="template_096">
    <xsl:element name="jptmk:DistinctionLaw">
        <xsl:value-of select="DISTINCTION-OF-THE-LAW"/>
    </xsl:element>
  </xsl:template>

  <!--審査官グループ-->
  <xsl:template name="template_097">
    <xsl:if test="count(EXAMINER-GROUP) &gt; 0">
      <xsl:element name="jptmk:ExaminerBag">
        <xsl:for-each select="EXAMINER-GROUP/EXAMINER">
          <xsl:element name="jptmk:Examiner">
            <xsl:element name="com:Name">
              <xsl:element name="com:PersonName">
                <xsl:element name="com:PersonFullName">
                  <xsl:value-of select="NAME"/>
                </xsl:element>
              </xsl:element>
            </xsl:element>
          </xsl:element>
        </xsl:for-each>
      </xsl:element>
    </xsl:if>
  </xsl:template>
  
  <!--審判官グループ-->
  <xsl:template name="template_102">
    <xsl:if test="count(APPEAL-EXAMINER-GROUP) &gt; 0">
      <xsl:element name="jptmk:AppealExaminerBag">
        <xsl:for-each select="APPEAL-EXAMINER-GROUP/APPEAL-EXAMINER-IN-CHIEF">
          <xsl:element name="jptmk:ChiefAppealExaminer">
            <xsl:element name="com:Name">
              <xsl:element name="com:PersonName">
                <xsl:element name="com:PersonFullName">
                  <xsl:value-of select="NAME"/>
                </xsl:element>
              </xsl:element>
            </xsl:element>
          </xsl:element>
        </xsl:for-each>
        <xsl:for-each select="APPEAL-EXAMINER-GROUP/APPEAL-EXAMINER">
          <xsl:element name="jptmk:AppealExaminer">
            <xsl:element name="com:Name">
              <xsl:element name="com:PersonName">
                <xsl:element name="com:PersonFullName">
                  <xsl:value-of select="NAME"/>
                </xsl:element>
              </xsl:element>
            </xsl:element>
          </xsl:element>
        </xsl:for-each>
      </xsl:element>
    </xsl:if>
  </xsl:template>

  <!--称呼データ-->
  <xsl:template name="template_111">
    <xsl:if test="count(PRONUNCIATION) &gt; 0">
      <xsl:element name="jptmk:Pronunciation">
        <xsl:value-of select="PRONUNCIATION"/>
      </xsl:element>
    </xsl:if>
  </xsl:template>
  
  <!--検索用商標-->
  <xsl:template name="template_112">
    <xsl:if test="count(TRADEMARK-FOR-INDICATION) &gt; 0">
      <xsl:element name="tmk:PseudoMarkText">
        <xsl:value-of select="TRADEMARK-FOR-INDICATION"/>
      </xsl:element>
    </xsl:if>
  </xsl:template>
          
  <!--類似群コードグループ-->
  <xsl:template name="template_113">
    <xsl:if test="count(SIMILAR-GROUP-CODE-GROUP) &gt; 0">
      <xsl:element name="jptmk:SimilarGroupBag">
        <xsl:for-each select="SIMILAR-GROUP-CODE-GROUP/SIMILAR-GROUP">
          <xsl:element name="jptmk:SimilarGroup">
            <xsl:element name="jptmk:SimilarGroupClassification">
              <xsl:value-of select="SIMILAR-GROUP-CLASSIFICATION"/>
            </xsl:element>
            <xsl:element name="jptmk:SimilarGroupCode">
              <xsl:value-of select="SIMILAR-GROUP-CODE"/>
            </xsl:element>
          </xsl:element>
        </xsl:for-each>
        <xsl:value-of select="VIENNA-FIGURE-CLASSIFICATION"/>
      </xsl:element>
    </xsl:if>
  </xsl:template>  
  
  <!--ウィーン分類-->
  <xsl:template name="template_117">
    <xsl:if test="string-length(VIENNA-FIGURE-CLASSIFICATION) &gt; 0">
      <xsl:element name="jptmk:ViennaFigureClassificationText">
        <xsl:value-of select="VIENNA-FIGURE-CLASSIFICATION"/>
      </xsl:element>
    </xsl:if>
  </xsl:template>  

  <xsl:template match="@* | node()">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
  </xsl:template>
</xsl:stylesheet>
