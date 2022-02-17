<?xml version="1.0" encoding="UTF-8" ?>
<!--****************************************-->
<!--XSL Version:V1.0-01-01,DATE 2022.01.04  -->
<!--****************************************-->
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
    <!-- 【ｎｎｎｎ】など -->
    <xsl:template match="com:P" name="comP">
        <div>
            <xsl:if test="@com:pNumber!=''">
                <xsl:text>【</xsl:text>
                <span data-function="convHalfCharToFullChar" data-size="1">
                    <xsl:attribute name="data-value1">
                        <xsl:value-of select="@com:pNumber" />
                    </xsl:attribute>
                </span>
                <xsl:text>】</xsl:text>
            </xsl:if>
        </div>
        <div>
            <xsl:apply-templates />
        </div>
    </xsl:template>
    <!-- ボールド -->
    <xsl:template match="com:B" name="comB">
        <B>
            <xsl:apply-templates />
        </B>
    </xsl:template>
    <!-- イタリック -->
    <xsl:template match="com:I" name="comI">
        <I>
            <xsl:apply-templates />
        </I>
    </xsl:template>
    <!-- 下線 -->
    <xsl:template match="com:U" name="comU">
        <U>
            <xsl:apply-templates />
        </U>
    </xsl:template>
    <!-- 上付 -->
    <xsl:template match="com:Sup" name="comSup">
        <SUP>
            <xsl:apply-templates />
        </SUP>
    </xsl:template>
    <!-- 下付 -->
    <xsl:template match="com:Sub" name="comSub">
        <SUB>
            <xsl:apply-templates />
        </SUB>
    </xsl:template>
    <!-- イメージ -->
    <xsl:template match="com:Image" name="comImage">
        <div>
            <a>
                <xsl:attribute name="href">
                    <xsl:value-of select="com:FileName" />
                </xsl:attribute>
                <!--ファイルタイプ-->
                <xsl:if test="com:ImageFormatCategory='JPEG'">
                    <xsl:value-of select="com:FileName" />
                </xsl:if>
                <xsl:if test="com:ImageFormatCategory='TIFF'">
                    <xsl:value-of select="com:FileName" />
                </xsl:if>
            </a>
        </div>
    </xsl:template>
    <!-- 改行 -->
    <xsl:template match="com:Br" name="comBr">
        <br>
            <xsl:apply-templates />
        </br>
    </xsl:template>
    <!-- 数式 -->
    <xsl:template match="com:Math" name="comMath">
        <div>
            <xsl:text>【数</xsl:text>
            <span data-function="convHalfCharToFullChar" data-size="1">
                <xsl:attribute name="data-value1">
                    <xsl:value-of select="@com:mathNumber" />
                </xsl:attribute>
            </span>
            <xsl:text>】</xsl:text>
        </div>
        <xsl:apply-templates select="com:Image" />
    </xsl:template>
    <!-- 化学式 -->
    <xsl:template match="com:ChemicalFormulae" name="comChemicalFormulae">
        <div>
            <xsl:text>【化</xsl:text>
            <span data-function="convHalfCharToFullChar" data-size="1">
                <xsl:attribute name="data-value1">
                    <xsl:value-of select="@com:chemicalFormulaeNumber" />
                </xsl:attribute>
            </span>
            <xsl:text>】</xsl:text>
        </div>
        <xsl:apply-templates select="com:Image" />
    </xsl:template>
    <!-- 特許文献 -->
    <xsl:template match="com:PatentCitation" name="comPatentCitation">
        <div>
            <xsl:text>【特許文献</xsl:text>
            <span data-function="convHalfCharToFullChar" data-size="1">
                <xsl:attribute name="data-value1">
                    <xsl:value-of select="@com:sequenceNumber" />
                </xsl:attribute>
            </span>
            <xsl:text>】</xsl:text>
            <xsl:value-of select="com:PatentCitationText" />
        </div>
    </xsl:template>
    <!-- 非特許文献 -->
    <xsl:template match="com:NPLCitation" name="comNPLCitation">
        <div>
            <xsl:text>【非特許文献</xsl:text>
            <span data-function="convHalfCharToFullChar" data-size="1">
                <xsl:attribute name="data-value1">
                    <xsl:value-of select="@com:sequenceNumber" />
                </xsl:attribute>
            </span>
            <xsl:text>】</xsl:text>
            <xsl:value-of select="com:NPLCitationText" />
        </div>
    </xsl:template>
    <!-- 図の説明 -->
    <xsl:template match="com:FigureReference" name="comFigureReference">
        <div>
            <xsl:text>【図</xsl:text>
            <span data-function="convHalfCharToFullChar" data-size="1">
                <xsl:attribute name="data-value1">
                    <xsl:value-of select="@com:referencedFigureNumber" />
                </xsl:attribute>
            </span>
            <xsl:text>】</xsl:text>
            <xsl:apply-templates />
        </div>
    </xsl:template>
    <!-- 表 -->
    <xsl:template match="com:Table" name="comTable">
        <xsl:apply-templates select="com:TableImage" />
    </xsl:template>
    <!-- 表イメージ -->
    <xsl:template match="com:TableImage" name="com:TableImage">
        <div>
            <xsl:text>【表</xsl:text>
            <span data-function="convHalfCharToFullChar" data-size="1">
                <xsl:attribute name="data-value1">
                    <xsl:value-of select="@com:tableNumber" />
                </xsl:attribute>
            </span>
            <xsl:text>】</xsl:text>
        </div>
        <xsl:call-template name="comImage" />
    </xsl:template>
</xsl:transform>