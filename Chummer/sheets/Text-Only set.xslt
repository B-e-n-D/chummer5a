<?xml version="1.0" encoding="utf-8" ?>
<!-- Text-Only Character Sheet -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:msxsl="urn:schemas-microsoft-com:xslt">
  <xsl:include href="xs.Chummer5CSS.xslt" />
  <xsl:include href="xs.fnx.xslt" />
  <xsl:include href="xt.MovementRate.xslt" />
  <xsl:include href="xt.PreserveHtml.xslt" />
  <xsl:include href="xt.PreserveLineBreaks.xslt" />
  <xsl:include href="xs.TitleName.xslt" />

  <xsl:template match="/characters/character">
    <xsl:variable name="TitleName">
      <xsl:call-template name="TitleName">
        <xsl:with-param name="name" select="name" />
        <xsl:with-param name="alias" select="alias" />
      </xsl:call-template>
    </xsl:variable>
    <title><xsl:value-of select="$TitleName" /></title>

    <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
      <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta charset="UTF-8" />
        <xsl:call-template name="Chummer5CSS" />
      </head>

      <body>
        <div id="DataBlock">
          == <xsl:value-of select="$lang.PersonalData" /> ==
          <br /><xsl:value-of select="$lang.StreetName" />: <xsl:value-of select="alias" />
          <br /><xsl:value-of select="$lang.Name" />: <xsl:value-of select="name" />
          <xsl:if test="movementwalk != '' and movementwalk != '0'">
            <br /><xsl:value-of select="$lang.Movement" />:
            <xsl:call-template name="formatrate">
              <xsl:with-param name="movrate" select="movementwalk" />
            </xsl:call-template>
          </xsl:if>
          <xsl:if test="movementswim != '' and movementswim != '0'">
            <br /><xsl:value-of select="$lang.Swim" />:
            <xsl:call-template name="formatrate">
              <xsl:with-param name="movrate" select="movementswim" />
            </xsl:call-template>
          </xsl:if>
          <xsl:if test="movementfly != '' and movementfly != '0'">
            <br /><xsl:value-of select="$lang.Fly" />:
            <xsl:call-template name="formatrate">
              <xsl:with-param name="movrate" select="movementfly" />
            </xsl:call-template>
          </xsl:if>
          <br /><xsl:value-of select="$lang.Karma" />: <xsl:value-of select="totalkarma" />
          <br /><xsl:value-of select="$lang.StreetCred" />: <xsl:value-of select="totalstreetcred" />
          <br /><xsl:value-of select="$lang.Notoriety" />: <xsl:value-of select="totalnotoriety" />
          <br /><xsl:value-of select="$lang.PublicAwareness" />: <xsl:value-of select="totalpublicawareness" />
          <xsl:if test="totalastralreputation != '0' or totalwildreputation != '0'">
            <br /><xsl:value-of select="$lang.AstralReputation" />: <xsl:value-of select="totalastralreputation" />
            <br /><xsl:value-of select="$lang.WildReputation" />: <xsl:value-of select="totalwildreputation" />
          </xsl:if>
          <br /><xsl:value-of select="metatype" />
            <xsl:if test="metavariant != ''">
              (<xsl:value-of select="metavariant" />)
            </xsl:if>
            <xsl:if test="gender != ''"><xsl:text> </xsl:text><xsl:value-of select="gender" /></xsl:if>
            <xsl:if test="age != ''"><xsl:text> </xsl:text><xsl:value-of select="$lang.Age" />&#160;<xsl:value-of select="age" /></xsl:if>
          <xsl:if test="height != '' or weight != ''">
            <br />
            <xsl:if test="height != ''"><xsl:value-of select="$lang.Height" />&#160;<xsl:value-of select="height" /><xsl:text> </xsl:text></xsl:if>
            <xsl:if test="weight != ''"><xsl:value-of select="$lang.Weight" />&#160;<xsl:value-of select="weight" /> </xsl:if>
          </xsl:if>
          <br /><xsl:value-of select="$lang.Composure" />: <xsl:value-of select="composure" />
          <br /><xsl:value-of select="$lang.JudgeIntentions" />: <xsl:value-of select="judgeintentions" />
          <br /><xsl:value-of select="$lang.LiftCarry" />: <xsl:value-of select="liftandcarry" /> (<xsl:value-of select="liftweight" /> kg/<xsl:value-of select="carryweight" /> kg)
          <br /><xsl:value-of select="$lang.Memory" />: <xsl:value-of select="memory" />
          <br /><xsl:value-of select="$lang.Nuyen" />:
            <xsl:value-of select="nuyen" />
            <xsl:value-of select="$lang.NuyenSymbol" />

          <xsl:if test="buildmethod = 'Priority'">
            <br />
            <br />== <xsl:value-of select="$lang.Priorities" /> ==
            <br /><xsl:value-of select="$lang.Metatype" />: <xsl:value-of select="prioritymetatype" />
            <br /><xsl:value-of select="$lang.Attributes" />: <xsl:value-of select="priorityattributes" />
            <br /><xsl:value-of select="$lang.Special" />: <xsl:value-of select="priorityspecial" />
            <br /><xsl:value-of select="$lang.Skills" />: <xsl:value-of select="priorityskills" />
            <br /><xsl:value-of select="$lang.Resources" />: <xsl:value-of select="priorityresources" />
          </xsl:if>

          <br />
          <br />== <xsl:value-of select="$lang.Attributes" /> ==
          <xsl:if test="attributes/attribute[../attributecategory_english != metatypecategory] and attributes/attributecategory != ''">
            <br /><xsl:value-of select="$lang.CurrentForm" />: <xsl:value-of select="attributes/attributecategory" />
          </xsl:if>
          <br /><xsl:value-of select="$lang.BOD" />: <xsl:value-of select="attributes/attribute[name_english = 'BOD' and (../attributecategory_english = metatypecategory or not(../attribute[name_english = 'BOD' and ../attributecategory_english = metatypecategory]))]/base" />
              <xsl:if test="attributes/attribute[name_english = 'BOD' and (../attributecategory_english = metatypecategory or not(../attribute[name_english = 'BOD' and ../attributecategory_english = metatypecategory]))]/total != attributes/attribute[name_english = 'BOD' and (../attributecategory_english = metatypecategory or not(../attribute[name_english = 'AGI' and ../attributecategory_english = metatypecategory]))]/base">
                (<xsl:value-of select="attributes/attribute[name_english = 'BOD' and (../attributecategory_english = metatypecategory or not(../attribute[name_english = 'BOD' and ../attributecategory_english = metatypecategory]))]/total" />)
              </xsl:if>
          <br /><xsl:value-of select="$lang.AGI" />: <xsl:value-of select="attributes/attribute[name_english = 'AGI' and (../attributecategory_english = metatypecategory or not(../attribute[name_english = 'AGI' and ../attributecategory_english = metatypecategory]))]/base" />
              <xsl:if test="attributes/attribute[name_english = 'AGI' and (../attributecategory_english = metatypecategory or not(../attribute[name_english = 'AGI' and ../attributecategory_english = metatypecategory]))]/total != attributes/attribute[name_english = 'AGI' and (../attributecategory_english = metatypecategory or not(../attribute[name_english = 'AGI' and ../attributecategory_english = metatypecategory]))]/base">
                (<xsl:value-of select="attributes/attribute[name_english = 'AGI' and (../attributecategory_english = metatypecategory or not(../attribute[name_english = 'AGI' and ../attributecategory_english = metatypecategory]))]/total" />)
              </xsl:if>
          <br /><xsl:value-of select="$lang.REA" />: <xsl:value-of select="attributes/attribute[name_english = 'REA' and (../attributecategory_english = metatypecategory or not(../attribute[name_english = 'REA' and ../attributecategory_english = metatypecategory]))]/base" />
              <xsl:if test="attributes/attribute[name_english = 'REA' and (../attributecategory_english = metatypecategory or not(../attribute[name_english = 'REA' and ../attributecategory_english = metatypecategory]))]/total != attributes/attribute[name_english = 'REA' and (../attributecategory_english = metatypecategory or not(../attribute[name_english = 'REA' and ../attributecategory_english = metatypecategory]))]/base">
                (<xsl:value-of select="attributes/attribute[name_english = 'REA' and (../attributecategory_english = metatypecategory or not(../attribute[name_english = 'REA' and ../attributecategory_english = metatypecategory]))]/total" />)
              </xsl:if>
          <br /><xsl:value-of select="$lang.STR" />: <xsl:value-of select="attributes/attribute[name_english = 'STR' and (../attributecategory_english = metatypecategory or not(../attribute[name_english = 'STR' and ../attributecategory_english = metatypecategory]))]/base" />
              <xsl:if test="attributes/attribute[name_english = 'STR' and (../attributecategory_english = metatypecategory or not(../attribute[name_english = 'STR' and ../attributecategory_english = metatypecategory]))]/total != attributes/attribute[name_english = 'STR' and (../attributecategory_english = metatypecategory or not(../attribute[name_english = 'STR' and ../attributecategory_english = metatypecategory]))]/base">
                (<xsl:value-of select="attributes/attribute[name_english = 'STR' and (../attributecategory_english = metatypecategory or not(../attribute[name_english = 'STR' and ../attributecategory_english = metatypecategory]))]/total" />)
              </xsl:if>
          <br /><xsl:value-of select="$lang.CHA" />: <xsl:value-of select="attributes/attribute[name_english = 'CHA' and (../attributecategory_english = metatypecategory or not(../attribute[name_english = 'CHA' and ../attributecategory_english = metatypecategory]))]/base" />
              <xsl:if test="attributes/attribute[name_english = 'CHA' and (../attributecategory_english = metatypecategory or not(../attribute[name_english = 'CHA' and ../attributecategory_english = metatypecategory]))]/total != attributes/attribute[name_english = 'CHA' and (../attributecategory_english = metatypecategory or not(../attribute[name_english = 'CHA' and ../attributecategory_english = metatypecategory]))]/base">
                (<xsl:value-of select="attributes/attribute[name_english = 'CHA' and (../attributecategory_english = metatypecategory or not(../attribute[name_english = 'CHA' and ../attributecategory_english = metatypecategory]))]/total" />)
              </xsl:if>
          <br /><xsl:value-of select="$lang.INT" />: <xsl:value-of select="attributes/attribute[name_english = 'INT' and (../attributecategory_english = metatypecategory or not(../attribute[name_english = 'INT' and ../attributecategory_english = metatypecategory]))]/base" />
              <xsl:if test="attributes/attribute[name_english = 'INT' and (../attributecategory_english = metatypecategory or not(../attribute[name_english = 'INT' and ../attributecategory_english = metatypecategory]))]/total != attributes/attribute[name_english = 'INT' and (../attributecategory_english = metatypecategory or not(../attribute[name_english = 'INT' and ../attributecategory_english = metatypecategory]))]/base">
                (<xsl:value-of select="attributes/attribute[name_english = 'INT' and (../attributecategory_english = metatypecategory or not(../attribute[name_english = 'INT' and ../attributecategory_english = metatypecategory]))]/total" />)
              </xsl:if>
          <br /><xsl:value-of select="$lang.LOG" />: <xsl:value-of select="attributes/attribute[name_english = 'LOG' and (../attributecategory_english = metatypecategory or not(../attribute[name_english = 'LOG' and ../attributecategory_english = metatypecategory]))]/base" />
              <xsl:if test="attributes/attribute[name_english = 'LOG' and (../attributecategory_english = metatypecategory or not(../attribute[name_english = 'LOG' and ../attributecategory_english = metatypecategory]))]/total != attributes/attribute[name_english = 'LOG' and (../attributecategory_english = metatypecategory or not(../attribute[name_english = 'LOG' and ../attributecategory_english = metatypecategory]))]/base">
                (<xsl:value-of select="attributes/attribute[name_english = 'LOG' and (../attributecategory_english = metatypecategory or not(../attribute[name_english = 'LOG' and ../attributecategory_english = metatypecategory]))]/total" />)
              </xsl:if>
          <br /><xsl:value-of select="$lang.WIL" />: <xsl:value-of select="attributes/attribute[name_english = 'WIL' and (../attributecategory_english = metatypecategory or not(../attribute[name_english = 'WIL' and ../attributecategory_english = metatypecategory]))]/base" />
              <xsl:if test="attributes/attribute[name_english = 'WIL' and (../attributecategory_english = metatypecategory or not(../attribute[name_english = 'WIL' and ../attributecategory_english = metatypecategory]))]/total != attributes/attribute[name_english = 'WIL' and (../attributecategory_english = metatypecategory or not(../attribute[name_english = 'WIL' and ../attributecategory_english = metatypecategory]))]/base">
                (<xsl:value-of select="attributes/attribute[name_english = 'WIL' and (../attributecategory_english = metatypecategory or not(../attribute[name_english = 'WIL' and ../attributecategory_english = metatypecategory]))]/total" />)
              </xsl:if>
          <br /><xsl:value-of select="$lang.EDG" />: <xsl:value-of select="attributes/attribute[name_english = 'EDG' and (../attributecategory_english = metatypecategory or not(../attribute[name_english = 'EDG' and ../attributecategory_english = metatypecategory]))]/base" />
              <xsl:if test="attributes/attribute[name_english = 'EDG' and (../attributecategory_english = metatypecategory or not(../attribute[name_english = 'EDG' and ../attributecategory_english = metatypecategory]))]/total != attributes/attribute[name_english = 'EDG' and (../attributecategory_english = metatypecategory or not(../attribute[name_english = 'EDG' and ../attributecategory_english = metatypecategory]))]/base">
                (<xsl:value-of select="attributes/attribute[name_english = 'EDG' and (../attributecategory_english = metatypecategory or not(../attribute[name_english = 'EDG' and ../attributecategory_english = metatypecategory]))]/total" />)
              </xsl:if>
          <xsl:if test="magenabled = 'True'">
            <br /><xsl:value-of select="$lang.MAG" />: <xsl:value-of select="attributes/attribute[name_english = 'MAG' and (../attributecategory_english = metatypecategory or not(../attribute[name_english = 'MAG' and ../attributecategory_english = metatypecategory]))]/base" />
            <xsl:if test="attributes/attribute[name_english = 'MAG' and (../attributecategory_english = metatypecategory or not(../attribute[name_english = 'MAG' and ../attributecategory_english = metatypecategory]))]/total != attributes/attribute[name_english = 'MAG' and (../attributecategory_english = metatypecategory or not(../attribute[name_english = 'MAG' and ../attributecategory_english = metatypecategory]))]/base">
              (<xsl:value-of select="attributes/attribute[name_english = 'MAG' and (../attributecategory_english = metatypecategory or not(../attribute[name_english = 'MAG' and ../attributecategory_english = metatypecategory]))]/total" />)
            </xsl:if>
            <xsl:if test="attributes/attribute[name_english = 'MAGAdept' and (../attributecategory_english = metatypecategory or not(../attribute[name_english = 'MAGAdept' and ../attributecategory_english = metatypecategory]))]"> | <xsl:value-of select="attributes/attribute[name_english = 'MAGAdept' and (../attributecategory_english = metatypecategory or not(../attribute[name_english = 'MAGAdept' and ../attributecategory_english = metatypecategory]))]/base" />
              <xsl:if test="attributes/attribute[name_english = 'MAGAdept' and (../attributecategory_english = metatypecategory or not(../attribute[name_english = 'MAGAdept' and ../attributecategory_english = metatypecategory]))]/total != attributes/attribute[name_english = 'MAGAdept']/base">
                (<xsl:value-of select="attributes/attribute[name_english = 'MAGAdept' and (../attributecategory_english = metatypecategory or not(../attribute[name_english = 'MAGAdept' and ../attributecategory_english = metatypecategory]))]/total" />)
              </xsl:if>
            </xsl:if>
          </xsl:if>
          <xsl:if test="resenabled = 'True'">
            <br /><xsl:value-of select="$lang.RES" />: <xsl:value-of select="attributes/attribute[name_english = 'RES' and (../attributecategory_english = metatypecategory or not(../attribute[name_english = 'RES' and ../attributecategory_english = metatypecategory]))]/base" />
            <xsl:if test="attributes/attribute[name_english = 'RES' and (../attributecategory_english = metatypecategory or not(../attribute[name_english = 'RES' and ../attributecategory_english = metatypecategory]))]/total != attributes/attribute[name_english = 'RES' and (../attributecategory_english = metatypecategory or not(../attribute[name_english = 'RES' and ../attributecategory_english = metatypecategory]))]/base">
              (<xsl:value-of select="attributes/attribute[name_english = 'RES' and (../attributecategory_english = metatypecategory or not(../attribute[name_english = 'RES' and ../attributecategory_english = metatypecategory]))]/total" />)
            </xsl:if>
          </xsl:if>
          <xsl:if test="depenabled = 'True'">
            <br /><xsl:value-of select="$lang.DEP" />: <xsl:value-of select="attributes/attribute[name_english = 'DEP' and (../attributecategory_english = metatypecategory or not(../attribute[name_english = 'DEP' and ../attributecategory_english = metatypecategory]))]/base" />
            <xsl:if test="attributes/attribute[name_english = 'DEP' and (../attributecategory_english = metatypecategory or not(../attribute[name_english = 'DEP' and ../attributecategory_english = metatypecategory]))]/total != attributes/attribute[name_english = 'DEP' and (../attributecategory_english = metatypecategory or not(../attribute[name_english = 'DEP' and ../attributecategory_english = metatypecategory]))]/base">
              (<xsl:value-of select="attributes/attribute[name_english = 'DEP' and (../attributecategory_english = metatypecategory or not(../attribute[name_english = 'DEP' and ../attributecategory_english = metatypecategory]))]/total" />)
            </xsl:if>
          </xsl:if>

          <br />
          <br />== <xsl:value-of select="$lang.DerivedAttributes" /> ==
          <br /><xsl:call-template name="fnx-pad-r">
              <xsl:with-param name="string" select="concat($lang.Essence,': ')" />
              <xsl:with-param name="length" select="26" />
            </xsl:call-template>
            <xsl:value-of select="totaless" />
          <br /><xsl:call-template name="fnx-pad-r">
              <xsl:with-param name="string" select="concat($lang.Initiative,': ')" />
              <xsl:with-param name="length" select="25" />
            </xsl:call-template>
            <xsl:call-template name="fnx-pad-l">
              <xsl:with-param name="string" select="init" />
              <xsl:with-param name="length" select="2" />
            </xsl:call-template>
          <br /><xsl:call-template name="fnx-pad-r">
              <xsl:with-param name="string" select="concat($lang.RiggerInitiative,': ')" />
              <xsl:with-param name="length" select="25" />
            </xsl:call-template>
            <xsl:call-template name="fnx-pad-l">
              <xsl:with-param name="string" select="riggerinit" />
              <xsl:with-param name="length" select="2" />
            </xsl:call-template>
          <br /><xsl:call-template name="fnx-pad-r">
              <xsl:with-param name="string" select="concat($lang.AstralInitiative,': ')" />
              <xsl:with-param name="length" select="25" />
            </xsl:call-template>
            <xsl:call-template name="fnx-pad-l">
              <xsl:with-param name="string" select="astralinit" />
              <xsl:with-param name="length" select="2" />
            </xsl:call-template>
          <br /><xsl:call-template name="fnx-pad-r">
              <xsl:with-param name="string" select="concat($lang.MatrixAR,': ')" />
              <xsl:with-param name="length" select="25" />
            </xsl:call-template>
            <xsl:call-template name="fnx-pad-l">
              <xsl:with-param name="string" select="matrixinit" />
              <xsl:with-param name="length" select="2" />
            </xsl:call-template>
          <br /><xsl:call-template name="fnx-pad-r">
              <xsl:with-param name="string" select="concat($lang.MatrixCold,': ')" />
              <xsl:with-param name="length" select="25" />
            </xsl:call-template>
            <xsl:call-template name="fnx-pad-l">
              <xsl:with-param name="string" select="matrixcoldinit" />
              <xsl:with-param name="length" select="2" />
            </xsl:call-template>
          <br /><xsl:call-template name="fnx-pad-r">
              <xsl:with-param name="string" select="concat($lang.MatrixHot,': ')" />
              <xsl:with-param name="length" select="25" />
            </xsl:call-template>
            <xsl:call-template name="fnx-pad-l">
              <xsl:with-param name="string" select="matrixhotinit" />
              <xsl:with-param name="length" select="2" />
            </xsl:call-template>
          <xsl:variable name="PhysicalTrackTitle">
            <xsl:choose>
              <xsl:when test="physicalcmiscorecm = 'True'">
                <xsl:value-of select="$lang.CoreTrack" />
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="$lang.PhysicalTrack" />
              </xsl:otherwise>
            </xsl:choose>
          </xsl:variable>
          <br /><xsl:call-template name="fnx-pad-r">
              <xsl:with-param name="string" select="concat($PhysicalTrackTitle,': ')" />
              <xsl:with-param name="length" select="25" />
            </xsl:call-template>
            <xsl:call-template name="fnx-pad-l">
              <xsl:with-param name="string" select="physicalcm" />
              <xsl:with-param name="length" select="2" />
            </xsl:call-template>
          <br />
          <xsl:choose>
            <xsl:when test="physicalcmiscorecm != 'True' or stuncmismatrixcm = 'True'">
              <xsl:variable name="StunTrackTitle">
                <xsl:choose>
                  <xsl:when test="stuncmismatrixcm = 'True'">
                    <xsl:value-of select="$lang.MatrixTrack" />
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="$lang.StunTrack" />
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:variable>
              <xsl:call-template name="fnx-pad-r">
                <xsl:with-param name="string" select="concat($StunTrackTitle,': ')" />
                <xsl:with-param name="length" select="25" />
              </xsl:call-template>
              <xsl:call-template name="fnx-pad-l">
                <xsl:with-param name="string" select="stuncm" />
                <xsl:with-param name="length" select="2" />
              </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
              <xsl:call-template name="fnx-pad-r">
                <xsl:with-param name="string" select="' '" />
                <xsl:with-param name="length" select="25" />
              </xsl:call-template>
              <xsl:value-of select="stuncm" />
            </xsl:otherwise>
          </xsl:choose>
          <br />
          <br />== <xsl:value-of select="$lang.Limits" /> ==
          <br /><xsl:call-template name="fnx-pad-r">
              <xsl:with-param name="string" select="concat($lang.Physical,':')" />
              <xsl:with-param name="length" select="25" />
            </xsl:call-template>
            <xsl:call-template name="fnx-pad-l">
              <xsl:with-param name="string" select="limitphysical" />
              <xsl:with-param name="length" select="2" />
            </xsl:call-template>
            <xsl:call-template name="limitmodifiersphys" />
          <br /><xsl:call-template name="fnx-pad-r">
              <xsl:with-param name="string" select="concat($lang.Mental,':')" />
              <xsl:with-param name="length" select="25" />
            </xsl:call-template>
            <xsl:call-template name="fnx-pad-l">
              <xsl:with-param name="string" select="limitmental" />
              <xsl:with-param name="length" select="2" />
            </xsl:call-template>
            <xsl:call-template name="limitmodifiersment" />
          <br /><xsl:call-template name="fnx-pad-r">
              <xsl:with-param name="string" select="concat($lang.Social,':')" />
              <xsl:with-param name="length" select="25" />
            </xsl:call-template>
            <xsl:call-template name="fnx-pad-l">
              <xsl:with-param name="string" select="limitsocial" />
              <xsl:with-param name="length" select="2" />
            </xsl:call-template>
            <xsl:call-template name="limitmodifierssoc" />
          <br /><xsl:call-template name="fnx-pad-r">
              <xsl:with-param name="string" select="concat($lang.Astral,':')" />
              <xsl:with-param name="length" select="25" />
            </xsl:call-template>
            <xsl:call-template name="fnx-pad-l">
              <xsl:with-param name="string" select="limitastral" />
              <xsl:with-param name="length" select="2" />
            </xsl:call-template>
            <xsl:call-template name="limitmodifiersast" />

          <br />
          <br />== <xsl:value-of select="$lang.ActiveSkills" /> ==
          <xsl:call-template name="activeskills" />

          <br />
          <br />== <xsl:value-of select="$lang.KnowledgeSkills" /> ==
          <xsl:call-template name="knowledgeskills" />

          <xsl:if test="contacts/contact">
            <br />
            <br />== <xsl:value-of select="$lang.Contacts" /> ==
            <xsl:call-template name="contacts" />
          </xsl:if>

          <xsl:if test="qualities/quality">
            <br />
            <br />== <xsl:value-of select="$lang.Qualities" /> ==
            <xsl:call-template name="qualities" />
          </xsl:if>

          <xsl:if test="tradition and tradition/istechnomancertradition = 'False'">
            <br />
            <br />== <xsl:value-of select="$lang.Tradition" /> ==
            <br />
            <xsl:value-of select="tradition/name" />,
            <xsl:value-of select="$lang.ResistDrain" />:
            <xsl:value-of select="tradition/drainvalue" />
          </xsl:if>

          <xsl:if test="spells/spell">
            <br />
            <br />== <xsl:value-of select="$lang.Spells" /> ==
            <xsl:call-template name="spells" />
          </xsl:if>

          <xsl:if test="powers/power">
            <br />
            <br />== <xsl:value-of select="$lang.Powers" /> ==
            <xsl:call-template name="powers" />
          </xsl:if>

          <xsl:if test="complexforms/complexform">
            <br />
            <br />== <xsl:value-of select="$lang.ComplexForms" /> ==
            <br />(<xsl:value-of select="$lang.Tradition" />: <xsl:value-of select="tradition/name" />, <xsl:value-of select="$lang.ResistFading" />&#160;<xsl:value-of select="tradition/drainattributes" /> = <xsl:value-of select="tradition/drainvalue" />)
            <xsl:call-template name="complexforms" />
          </xsl:if>

          <xsl:if test="aiprograms/aiprogram">
            <br />
            <br />== <xsl:value-of select="$lang.AIandAdvanced" /> ==
            <xsl:call-template name="aiprograms" />
          </xsl:if>

          <xsl:if test="critterpowers/critterpower">
            <br />
            <br />== <xsl:value-of select="$lang.CritterPowers" /> ==
            <xsl:call-template name="critterpowers" />
          </xsl:if>

          <xsl:if test="lifestyles/lifestyle">
            <br />
            <br />== <xsl:value-of select="$lang.Lifestyle" /> ==
            <xsl:call-template name="lifestyle" />
          </xsl:if>

          <xsl:if test="cyberwares/cyberware">
            <br />
            <br />== <xsl:value-of select="$lang.Cyberware" />/<xsl:value-of select="$lang.Bioware" /> ==
            <xsl:call-template name="cyberware" />
          </xsl:if>

          <xsl:if test="armors/armor">
            <br />
            <br />== <xsl:value-of select="$lang.Armor" /> ==
            <xsl:call-template name="armors" />
          </xsl:if>

          <xsl:if test="weapons/weapon">
            <br />
            <br />== <xsl:value-of select="$lang.Weapons" /> ==
            <xsl:call-template name="weapons" />
          </xsl:if>

          <xsl:if test="martialarts/martialart">
            <br />
            <br />== <xsl:value-of select="$lang.MartialArts" /> ==
            <xsl:call-template name="martialarts" />
          </xsl:if>

          <xsl:if test="//*[iscommlink = 'True' or isprogram = 'True']">
            <br />
            <br />== <xsl:value-of select="$lang.Commlink" /> ==
            <xsl:call-template name="commlinks" />
          </xsl:if>

          <xsl:if test="gears/gear[equipped = 'True' and location = '' and iscommlink != 'True' and isprogram != 'True']">
            <br />
            <br />== <xsl:value-of select="$lang.Gear" />: <xsl:value-of select="$lang.Equipped" /> ==
              <xsl:for-each select="gears/gear[equipped = 'True' and location = '' and iscommlink != 'True']">
                <xsl:sort select="name" />
                <xsl:call-template name="geardetail" />
              </xsl:for-each>
          </xsl:if>

          <xsl:if test="gears/gear[equipped != 'True' and location = '']">
            <br />
            <br />== <xsl:value-of select="$lang.Gear" />: <xsl:value-of select="$lang.Available" /> ==
              <xsl:for-each select="gears/gear[equipped != 'True' and location = '']">
                <xsl:sort select="name" />
                <xsl:call-template name="geardetail" />
              </xsl:for-each>
          </xsl:if>

          <xsl:if test="gears/gear[location != '']">
            <xsl:variable name="sorted_locn">
              <xsl:for-each select="gears/gear[location != '']">
                <xsl:sort select="location" />
                <xsl:sort select="name" />
                <xsl:copy-of select="current()" />
              </xsl:for-each>
            </xsl:variable>
            <xsl:for-each select="msxsl:node-set($sorted_locn)/gear">
              <xsl:if test="position() = 1 or location != preceding-sibling::gear[1]/location">
                <br />
                <br />== <xsl:value-of select="$lang.Location" />: <xsl:value-of select="location" /> ==
              </xsl:if>
              <xsl:call-template name="geardetail" />
            </xsl:for-each>
          </xsl:if>

          <xsl:if test="vehicles/vehicle">
            <br />
            <br />== <xsl:value-of select="$lang.Vehicles" /> ==
            <xsl:call-template name="vehicles" />
          </xsl:if>

          <xsl:if test="expenses">
            <br />
            <br />== <xsl:value-of select="$lang.Karma" />&#160;<xsl:value-of select="$lang.Expenses" /> ==
            <xsl:call-template name="karmaexpenses" />
          </xsl:if>

          <xsl:if test="expenses">
            <br />
            <br />== <xsl:value-of select="$lang.Nuyen" />&#160;<xsl:value-of select="$lang.Expenses" /> ==
            <xsl:call-template name="nuyenexpenses" />
          </xsl:if>

          <xsl:if test="description != ''">
            <br />
            <br />== <xsl:value-of select="$lang.Description" /> ==
            <br />
            <xsl:call-template name="PreserveHtml">
              <xsl:with-param name="text" select="description" />
            </xsl:call-template>
          </xsl:if>

          <xsl:if test="background != ''">
            <br />
            <br />== <xsl:value-of select="$lang.Background" /> ==
            <br />
            <xsl:call-template name="PreserveHtml">
              <xsl:with-param name="text" select="background" />
            </xsl:call-template>
          </xsl:if>

          <xsl:if test="concept != ''">
            <br />
            <br />== <xsl:value-of select="$lang.Concept" /> ==
            <br />
            <xsl:call-template name="PreserveHtml">
              <xsl:with-param name="text" select="concept" />
            </xsl:call-template>
          </xsl:if>

          <xsl:if test="notes != '' or gamenotes != ''">
            <br />
            <br />== <xsl:value-of select="$lang.Notes" /> ==
            <br />
            <xsl:call-template name="PreserveHtml">
              <xsl:with-param name="text" select="notes" />
            </xsl:call-template>
            <xsl:call-template name="PreserveHtml">
              <xsl:with-param name="text" select="gamenotes" />
            </xsl:call-template>
          </xsl:if>
        </div>
      </body>
    </html>
  </xsl:template>

    <xsl:template name="activeskills">
        <xsl:variable name="items" select="skills/skill[knowledge = 'False' and (base &gt; 0 or karma &gt; 0)]" />
    <xsl:call-template name="skills">
      <xsl:with-param name="items" select="$items" />
    </xsl:call-template>
    </xsl:template>

    <xsl:template name="knowledgeskills">
        <xsl:variable name="items1" select="skills/skill[knowledge = 'True' and islanguage = 'True']" />
    <xsl:call-template name="skills">
      <xsl:with-param name="items" select="$items1" />
    </xsl:call-template>
        <xsl:variable name="items2" select="skills/skill[knowledge = 'True' and islanguage != 'True']" />
    <xsl:call-template name="skills">
      <xsl:with-param name="items" select="$items2" />
    </xsl:call-template>
    </xsl:template>

  <xsl:template name="skills">
      <xsl:param name="items" />
        <xsl:for-each select="$items">
            <xsl:sort select="name" />
            <br />
      <xsl:variable name="snme">
        <xsl:value-of select="name" />
        <xsl:if test="spec != ''"> (<xsl:value-of select="spec" />) </xsl:if>
      </xsl:variable>
      <xsl:choose>
        <xsl:when test="string-length($snme) &gt; 29">
          <xsl:value-of select="$snme" />
		  <br />
          <xsl:call-template name="fnx-repeat">
            <xsl:with-param name="count" select="30" />
          </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="fnx-pad-r">
            <xsl:with-param name="string" select="$snme" />
            <xsl:with-param name="length" select="30" />
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:choose>
        <xsl:when test="isnativelanguage = 'True'">
          <xsl:value-of select="$lang.Native" />
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$lang.Rtg" />:
          <xsl:call-template name="fnx-pad-l">
            <xsl:with-param name="string" select="base + karma" />
            <xsl:with-param name="length" select="2" />
          </xsl:call-template>
          <xsl:call-template name="fnx-repeat">
            <xsl:with-param name="count" select="3" />
          </xsl:call-template>
          <xsl:value-of select="$lang.Pool" />:
          <xsl:call-template name="fnx-pad-l">
            <xsl:with-param name="string" select="total" />
            <xsl:with-param name="length" select="2" />
          </xsl:call-template>
          <xsl:if test="spec != '' and exotic = 'False'">
            (<xsl:value-of select="specializedrating" />)
          </xsl:if>
        </xsl:otherwise>
      </xsl:choose>
        </xsl:for-each>
    </xsl:template>

  <xsl:template name="contacts">
    <xsl:for-each select="contacts/contact">
      <xsl:sort select="type" />
      <xsl:sort select="name" />
      <br />
      <xsl:value-of select="name" />;
      <xsl:choose>
        <xsl:when test="type = 'Enemy'">
          <xsl:if test="location != ''">
            <xsl:value-of select="location" />;
          </xsl:if>
          <xsl:value-of select="role" />
          (<xsl:value-of select="type" />&#160;<xsl:value-of select="$lang.Connection" />&#160;<xsl:value-of select="connection" />)
        </xsl:when>
        <xsl:otherwise>
          <xsl:if test="location != ''">
            <xsl:value-of select="location" />;
          </xsl:if>
          <xsl:if test="role != ''">
            <xsl:value-of select="role" />
          </xsl:if>
          (<xsl:value-of select="connection" />,<xsl:value-of select="loyalty" />)
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="qualities">
    <xsl:for-each select="qualities/quality">
      <xsl:sort select="name" />
      <br /><xsl:value-of select="name" />
      <xsl:if test="extra != ''"> (<xsl:value-of select="normalize-space(extra)" />)</xsl:if>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="spells">
    <xsl:for-each select="spells/spell">
      <xsl:sort select="name" />
      <xsl:variable name="t.name">
        <xsl:value-of select="name" />
        <xsl:if test="extra != ''"> (<xsl:value-of select="extra" />)</xsl:if>
      </xsl:variable>
      <br /><xsl:call-template name="fnx-pad-r">
        <xsl:with-param name="string" select="$t.name" />
        <xsl:with-param name="length" select="30" />
      </xsl:call-template>
      <xsl:value-of select="$lang.DV" />: <xsl:value-of select="dv" />
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="powers">
    <xsl:for-each select="powers/power">
      <xsl:sort select="name" />
      <br /><xsl:value-of select="name" />
        <xsl:if test="extra != ''"> (<xsl:value-of select="extra" />)</xsl:if>
        <xsl:if test="rating &gt; 0">&#160;<xsl:value-of select="$lang.Rating" />: <xsl:value-of select="rating" /></xsl:if>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="critterpowers">
    <xsl:for-each select="critterpowers/critterpower">
      <xsl:sort select="name" />
      <br /><xsl:value-of select="name" />
        <xsl:if test="extra != ''"> (<xsl:value-of select="extra" />)</xsl:if>
        <xsl:if test="rating &gt; 0">&#160;<xsl:value-of select="$lang.Rating" />: <xsl:value-of select="rating" /></xsl:if>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="complexforms">
    <xsl:for-each select="complexforms/complexform">
      <xsl:sort select="name" />
      <br /><xsl:value-of select="name" />
      <xsl:if test="extra != ''"> (<xsl:value-of select="extra" />)</xsl:if>
      <xsl:if test="rating &gt; 0">&#160;<xsl:value-of select="$lang.Rating" />: <xsl:value-of select="rating" /></xsl:if>
      <xsl:if test="programoptions/programoption">
        (<xsl:for-each select="programoptions/programoption">
          <xsl:sort select="name" />
          <xsl:value-of select="name" />
          <xsl:if test="rating &gt; 0"><xsl:text> </xsl:text><xsl:value-of select="rating" /></xsl:if>
          <xsl:if test="position() != last()">, </xsl:if>
        </xsl:for-each>)
      </xsl:if>
    </xsl:for-each>
    <xsl:value-of select="$lang.Target" />: <xsl:value-of select="target" />,
    <xsl:value-of select="$lang.Duration" />: <xsl:value-of select="duration" />,
    <xsl:value-of select="$lang.FadingValue" />: <xsl:value-of select="fv" />
  </xsl:template>

  <xsl:template name="aiprograms">
    <xsl:for-each select="aiprograms/aiprogram">
      <xsl:sort select="name" />
      <br /><xsl:value-of select="name" />
      <xsl:if test="extra != ''">(<xsl:value-of select="extra" />)</xsl:if>
      <xsl:if test="requiresprogram != ''">
        <xsl:value-of select="$lang.Requires" />: <xsl:value-of select="requiresprogram" />
      </xsl:if>
      <xsl:if test="programoptions/programoption">
        (<xsl:for-each select="programoptions/programoption">
          <xsl:sort select="name" />
          <xsl:value-of select="name" />
          <xsl:if test="rating &gt; 0">
            <xsl:text> </xsl:text>
            <xsl:value-of select="rating" />
          </xsl:if>
          <xsl:if test="position() != last()">, </xsl:if>
          <xsl:if test="rating &gt; 0">
            <xsl:text> </xsl:text>
            <xsl:value-of select="rating" />
          </xsl:if>
          <xsl:if test="position() != last()">, </xsl:if>
        </xsl:for-each>)
      </xsl:if>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="lifestyle">
    <xsl:for-each select="lifestyles/lifestyle">
      <xsl:sort select="name" />
      <br /><xsl:value-of select="name" /> (
      <xsl:value-of select="baselifestyle" />
      <xsl:if test="borough != ''">
        <xsl:text>, </xsl:text><xsl:value-of select="borough" />
      </xsl:if>
      <xsl:if test="district != ''">
        <xsl:text>, </xsl:text><xsl:value-of select="district" />
      </xsl:if>
      <xsl:if test="city != ''">
        <xsl:text>, </xsl:text><xsl:value-of select="city" />
      </xsl:if><xsl:text>) </xsl:text>
        <xsl:value-of select="months" /><xsl:text> </xsl:text>
      <xsl:choose>
        <xsl:when test="increment = 'Day'">
          <xsl:choose>
            <xsl:when test="months = '1'">
              <xsl:value-of select="$lang.Day" />
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="$lang.Days" />
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <xsl:when test="increment = 'Week'">
          <xsl:choose>
            <xsl:when test="months = '1'">
              <xsl:value-of select="$lang.Week" />
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="$lang.Weeks" />
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <xsl:otherwise>
          <xsl:choose>
            <xsl:when test="months = '1'">
              <xsl:value-of select="$lang.Month" />
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="$lang.Months" />
            </xsl:otherwise>
          </xsl:choose>
        </xsl:otherwise>
      </xsl:choose>
        <xsl:for-each select="qualities/quality">
          <br />&#160;&#160;&#160;+ <xsl:value-of select="formattedname" />
        </xsl:for-each>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="cyberware">
    <xsl:for-each select="cyberwares/cyberware">
      <xsl:sort select="name" />
      <br /><xsl:value-of select="name" />
        <xsl:if test="rating != 0">&#160;<xsl:value-of select="$lang.Rating" />&#160;<xsl:value-of select="rating" /></xsl:if>
        <xsl:if test="extra != ''"> (<xsl:value-of select="extra" />)</xsl:if>
        <xsl:if test="location != ''"> (<xsl:value-of select="location" />)</xsl:if>
        <xsl:if test="children/cyberware">
          <xsl:for-each select="children/cyberware">
            <br />&#160;&#160;&#160;+ <xsl:value-of select="name" />
            <xsl:if test="rating != 0">&#160;<xsl:value-of select="$lang.Rating" />&#160;<xsl:value-of select="rating" /></xsl:if>
          </xsl:for-each>
        </xsl:if>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="gearplugin">
      <xsl:param name="gear" />
    <xsl:for-each select="children/gear">
      <xsl:sort select="name" />
      <xsl:value-of select="name" />
      <xsl:if test="rating != 0"><xsl:text> </xsl:text><xsl:value-of select="rating" /></xsl:if>
      <xsl:if test="extra != ''"> (<xsl:value-of select="extra" />)</xsl:if>
      <xsl:if test="qty &gt; 1"> ×<xsl:value-of select="qty" /></xsl:if>
      <xsl:if test="children/gear">
        [<xsl:call-template name="gearplugin">
          <xsl:with-param name="gear" select="." />
        </xsl:call-template>]
      </xsl:if>
      <xsl:if test="position() != last()">; </xsl:if>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="geardetail">
    <br /><xsl:value-of select="name" />
      <xsl:if test="extra != ''"> (<xsl:value-of select="extra" />)</xsl:if>
      <xsl:if test="rating != 0">&#160;<xsl:value-of select="$lang.Rating" />&#160;<xsl:value-of select="rating" /></xsl:if>
      <xsl:if test="qty &gt; 1"> ×<xsl:value-of select="qty" /></xsl:if>
      <xsl:if test="children/gear">
        <xsl:for-each select="children/gear">
          <br />&#160;&#160;&#160;+ <xsl:value-of select="name" />
          <xsl:if test="extra != ''"> (<xsl:value-of select="extra" />)</xsl:if>
          <xsl:if test="rating != 0">&#160;<xsl:value-of select="$lang.Rating" />&#160;<xsl:value-of select="rating" /></xsl:if>
          <xsl:if test="qty &gt; 1"> ×<xsl:value-of select="qty" /></xsl:if>
          <xsl:if test="children/gear">
            [<xsl:call-template name="gearplugin">
              <xsl:with-param name="gear" select="." />
            </xsl:call-template>]
          </xsl:if>
        </xsl:for-each>
      </xsl:if>
  </xsl:template>

  <xsl:template name="commlinks">
    <xsl:for-each select="//*[iscommlink = 'True']">
      <xsl:sort select="name" />
      <br /><xsl:value-of select="name" />
      (<xsl:value-of select="$lang.ATT" />: <xsl:value-of select="attack" />,
      <xsl:value-of select="$lang.SLZ" />: <xsl:value-of select="sleaze" />,
      <xsl:value-of select="$lang.DP" />: <xsl:value-of select="dataprocessing" />,
      <xsl:value-of select="$lang.FWL" />: <xsl:value-of select="firewall" />)
      <xsl:if test="extra != ''"> (<xsl:value-of select="extra" />)</xsl:if>
      <xsl:if test="rating != 0">&#160;<xsl:value-of select="$lang.Rating" />&#160;<xsl:value-of select="rating" /></xsl:if>
      <xsl:if test="qty &gt; 1"> ×<xsl:value-of select="qty" /></xsl:if>
      <xsl:if test="*/gear">
        <xsl:for-each select="*/gear">
          <br />&#160;&#160;&#160;+ <xsl:value-of select="name" />
          <xsl:if test="extra != ''"> (<xsl:value-of select="extra" />)</xsl:if>
          <xsl:if test="rating != 0">&#160;<xsl:value-of select="$lang.Rating" />&#160;<xsl:value-of select="rating" /></xsl:if>
          <xsl:if test="qty &gt; 1"> ×<xsl:value-of select="qty" /></xsl:if>
          <xsl:if test="children/gear">
            [<xsl:for-each select="children/gear">
              <xsl:sort select="name" />
              <xsl:value-of select="name" />
              <xsl:if test="rating != 0"><xsl:text> </xsl:text><xsl:value-of select="rating" /></xsl:if>
              <xsl:if test="extra != ''"> (<xsl:value-of select="extra" />)</xsl:if>
              <xsl:if test="qty &gt; 1"> ×<xsl:value-of select="qty" /></xsl:if>
              <xsl:if test="position() != last()">, </xsl:if>
            </xsl:for-each>]
          </xsl:if>
        </xsl:for-each>
      </xsl:if>
    </xsl:for-each>
    <xsl:if test="//*[isprogram = 'True']">
      <xsl:for-each select="//*[isprogram = 'True']">
        <xsl:sort select="name" />
        <br />&#160;&#160;&#160;+ <xsl:value-of select="name" />
        <xsl:if test="rating &gt; 0">
          <xsl:text> </xsl:text>
          <xsl:value-of select="rating" />
        </xsl:if>
        <xsl:if test="extra != ''">
          (<xsl:value-of select="extra" />)
        </xsl:if>
        <xsl:if test="children/gear">
          [<xsl:for-each select="children/gear">
            <xsl:sort select="name" />
            <xsl:value-of select="name" />
            <xsl:if test="rating != 0">
              <xsl:text> </xsl:text>
              <xsl:value-of select="rating" />
            </xsl:if>
            <xsl:if test="extra != ''">
              (<xsl:value-of select="extra" />)
            </xsl:if>
            <xsl:if test="qty &gt; 1">
              ×<xsl:value-of select="qty" />
            </xsl:if>
            <xsl:if test="position() != last()">, </xsl:if>
          </xsl:for-each>]
        </xsl:if>
      </xsl:for-each>
    </xsl:if>
  </xsl:template>

  <xsl:template name="weapons">
    <xsl:for-each select="weapons/weapon">
      <xsl:sort select="name" />
      <br /><xsl:value-of select="name" />
      <xsl:if test="weaponname != ''">
        ("<xsl:value-of select="weaponname" />")
      </xsl:if>
      <xsl:if test="accessories/accessory or mods/weaponmod">
        <xsl:for-each select="accessories/accessory">
          <xsl:sort select="name" />
          <br />&#160;&#160;&#160;+ <xsl:value-of select="name" />
        </xsl:for-each>
        <xsl:for-each select="mods/weaponmod">
          <xsl:sort select="name" />
          <xsl:if test="rating > 0">
          <xsl:value-of select="$lang.Rating" />&#160;<xsl:value-of select="rating" />
          </xsl:if>
          <br />&#160;&#160;&#160;+ <xsl:value-of select="name" />
        </xsl:for-each>
      </xsl:if>
      <br />&#160;&#160;&#160;Pool: <xsl:value-of select="dicepool" />&#160;&#160;&#160;<xsl:value-of select="$lang.Accuracy" />: <xsl:value-of select="accuracy" />&#160;&#160;&#160;<xsl:value-of select="$lang.DV" />: <xsl:value-of select="damage" />&#160;&#160;&#160;<xsl:value-of select="$lang.AP" />: <xsl:value-of select="ap" />&#160;&#160;&#160;<xsl:value-of select="$lang.RC" />: <xsl:value-of select="rc" />
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="armors">
    <xsl:for-each select="armors/armor">
      <xsl:sort select="name" />
      <xsl:variable name="anme">
        <xsl:value-of select="name" />
        <xsl:if test="armorname != ''"> (<xsl:value-of select="armorname" />) </xsl:if>
      </xsl:variable>
      <br /><xsl:call-template name="fnx-pad-r">
        <xsl:with-param name="string" select="$anme" />
        <xsl:with-param name="length" select="40" />
      </xsl:call-template>
      <xsl:call-template name="fnx-pad-l">
        <xsl:with-param name="string" select="armor" />
        <xsl:with-param name="length" select="2" />
      </xsl:call-template>
      <xsl:if test="armormods/armormod">
        <xsl:for-each select="armormods/armormod">
          <xsl:sort select="name" />
          <br />&#160;&#160;&#160;+ <xsl:value-of select="name" />
          <xsl:if test="rating != 0"><xsl:text> </xsl:text><xsl:value-of select="rating" /></xsl:if>
        </xsl:for-each>
      </xsl:if>
      <xsl:if test="gears/gear">
        <xsl:for-each select="gears/gear">
          <xsl:sort select="name" />
          <br />&#160;&#160;&#160;+ <xsl:value-of select="name" />
            <xsl:if test="extra != ''"> (<xsl:value-of select="extra" />)</xsl:if>
            <xsl:if test="rating != 0">&#160;<xsl:value-of select="$lang.Rating" />&#160;<xsl:value-of select="rating" /></xsl:if>
            <xsl:if test="qty &gt; 1"> ×<xsl:value-of select="qty" /></xsl:if>
            <xsl:if test="children/gear">
              <xsl:for-each select="children/gear">
                <br />&#160;&#160;&#160;&#160;&#160;&#160;+ <xsl:value-of select="name" />
                <xsl:if test="extra != ''"> (<xsl:value-of select="extra" />)</xsl:if>
                <xsl:if test="rating != 0">&#160;<xsl:value-of select="$lang.Rating" />&#160;<xsl:value-of select="rating" /></xsl:if>
                <xsl:if test="children/gear">
                  [<xsl:for-each select="children/gear">
                    <xsl:sort select="name" />
                    <xsl:value-of select="name" />
                    <xsl:if test="rating != 0"><xsl:text> </xsl:text><xsl:value-of select="rating" /></xsl:if>
                    <xsl:if test="extra != ''"> (<xsl:value-of select="extra" />)</xsl:if>
                    <xsl:if test="qty > 1"> ×<xsl:value-of select="qty" /></xsl:if>
                    <xsl:if test="position() != last()">, </xsl:if>
                  </xsl:for-each>]
                </xsl:if>
                <xsl:if test="qty > 1"> ×<xsl:value-of select="qty" /></xsl:if>
              </xsl:for-each>
            </xsl:if>
        </xsl:for-each>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="vehicles">
    <xsl:for-each select="vehicles/vehicle">
      <xsl:sort select="name" />
      <xsl:variable name="vnme">
        <xsl:value-of select="name" />
        <xsl:if test="vehiclename != ''"> ("<xsl:value-of select="vehiclename" />")</xsl:if>
      </xsl:variable>
      <br /><xsl:call-template name="fnx-pad-r">
        <xsl:with-param name="string" select="$vnme" />
        <xsl:with-param name="length" select="35" />
      </xsl:call-template>
      <xsl:if test="mods/mod">
        <xsl:for-each select="mods/mod">
          <xsl:sort select="name" />
          <br />&#160;&#160;&#160;+ <xsl:value-of select="name" />
            <xsl:if test="rating != 0">&#160;<xsl:value-of select="$lang.Rating" />&#160;<xsl:value-of select="rating" /></xsl:if>
            <xsl:if test="cyberwares/cyberware">
              (<xsl:for-each select="cyberwares/cyberware">
                <xsl:sort select="name" />
                <br />&#160;&#160;&#160;&#160;&#160;&#160;+ <xsl:value-of select="name" />
                <xsl:if test="rating != 0">&#160;<xsl:value-of select="$lang.Rating" />&#160;<xsl:value-of select="rating" /></xsl:if>
              </xsl:for-each>)
            </xsl:if>
        </xsl:for-each>
      </xsl:if>
      <xsl:if test="gears/gear">
        <xsl:for-each select="gears/gear[iscommlink != 'True' and isprogram != 'True']">
          <xsl:sort select="name" />
          <br />&#160;&#160;&#160;+ <xsl:value-of select="name" />
            <xsl:if test="extra != ''"> (<xsl:value-of select="extra" />)</xsl:if>
            <xsl:if test="rating != 0">&#160;<xsl:value-of select="$lang.Rating" />&#160;<xsl:value-of select="rating" /></xsl:if>
            <xsl:if test="qty &gt; 1"> ×<xsl:value-of select="qty" /></xsl:if>
            <xsl:if test="children/gear">
              <xsl:for-each select="children/gear">
                <br />&#160;&#160;&#160;&#160;&#160;&#160;+ <xsl:value-of select="name" />
                <xsl:if test="extra != ''"> (<xsl:value-of select="extra" />)</xsl:if>
                <xsl:if test="rating != 0">&#160;<xsl:value-of select="$lang.Rating" />&#160;<xsl:value-of select="rating" /></xsl:if>
                <xsl:if test="children/gear">
                  [<xsl:for-each select="children/gear">
                    <xsl:sort select="name" />
                    <xsl:value-of select="name" />
                    <xsl:if test="rating != 0"><xsl:text> </xsl:text><xsl:value-of select="rating" /></xsl:if>
                    <xsl:if test="extra != ''"> (<xsl:value-of select="extra" />)</xsl:if>
                    <xsl:if test="qty > 1"> ×<xsl:value-of select="qty" /></xsl:if>
                    <xsl:if test="position() != last()">, </xsl:if>
                  </xsl:for-each>]
                </xsl:if>
                <xsl:if test="qty &gt; 1"> ×<xsl:value-of select="qty" /></xsl:if>
              </xsl:for-each>
            </xsl:if>
        </xsl:for-each>
      </xsl:if>
      <xsl:if test="weapons/weapon">
        <xsl:for-each select="weapons/weapon">
          <xsl:sort select="name" />
          <br />&#160;&#160;&#160;+ <xsl:value-of select="name" />
          <xsl:if test="weaponname != ''">
            ("<xsl:value-of select="weaponname" />")
          </xsl:if>
          <xsl:if test="accessories/accessory or mods/weaponmod">
            <xsl:for-each select="accessories/accessory">
              <xsl:sort select="name" />
              <br />&#160;&#160;&#160;&#160;&#160;&#160;+ <xsl:value-of select="name" />
            </xsl:for-each>
            <xsl:for-each select="mods/weaponmod">
              <xsl:sort select="name" />
              <br />&#160;&#160;&#160;&#160;&#160;&#160;+ <xsl:value-of select="name" />
              <xsl:if test="rating > 0">
              <xsl:value-of select="$lang.Rating" />&#160;<xsl:value-of select="rating" />
              </xsl:if>
            </xsl:for-each>
          </xsl:if>
          <br />&#160;&#160;&#160;&#160;&#160;&#160;<xsl:value-of select="$lang.DV" />: <xsl:value-of select="damage" />&#160;&#160;&#160;<xsl:value-of select="$lang.AP" />: <xsl:value-of select="ap" />&#160;&#160;&#160;<xsl:value-of select="$lang.RC" />: <xsl:value-of select="rc" />
        </xsl:for-each>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="martialarts">
    <xsl:for-each select="martialarts/martialart">
      <xsl:sort select="name" />
      <br /><xsl:value-of select="name" />
      <xsl:for-each select="martialarttechniques/martialarttechnique">
        <xsl:sort select="name" />
        <br />&#160;&#160;&#160;+ <xsl:value-of select="name" />
      </xsl:for-each>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="karmaexpenses">
    <xsl:for-each select="expenses/expense[type = 'Karma']">
      <br />
      <xsl:call-template name="fnx-pad-r">
        <xsl:with-param name="string" select="date" />
        <xsl:with-param name="length" select="22" />
      </xsl:call-template>
      <xsl:call-template name="fnx-pad-l">
        <xsl:with-param name="string" select="amount" />
        <xsl:with-param name="length" select="8" />
      </xsl:call-template>
      <xsl:call-template name="fnx-repeat">
        <xsl:with-param name="count" select="3" />
      </xsl:call-template>
      <xsl:value-of select="reason" />
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="nuyenexpenses">
    <xsl:for-each select="expenses/expense[type = 'Nuyen']">
      <br />
      <xsl:call-template name="fnx-pad-r">
        <xsl:with-param name="string" select="date" />
        <xsl:with-param name="length" select="22" />
      </xsl:call-template>
      <xsl:call-template name="fnx-pad-l">
        <xsl:with-param name="string" select="amount" />
        <xsl:with-param name="length" select="8" />
      </xsl:call-template>
      <xsl:call-template name="fnx-pad-r">
        <xsl:with-param name="string" select="$lang.NuyenSymbol" />
        <xsl:with-param name="length" select="3" />
      </xsl:call-template>
      <xsl:value-of select="reason" />
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="limitmodifiersphys">
    <xsl:for-each select="limitmodifiersphys/limitmodifier">
      <xsl:sort select="name" />
      <br />&#160;&#160;&#160;<xsl:value-of select="name" />
      <xsl:if test="extra != ''"> (<xsl:value-of select="extra" />)</xsl:if>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="limitmodifiersment">
    <xsl:for-each select="limitmodifiersment/limitmodifier">
      <xsl:sort select="name" />
      <br />&#160;&#160;&#160;<xsl:value-of select="name" />
      <xsl:if test="extra != ''"> (<xsl:value-of select="extra" />)</xsl:if>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="limitmodifierssoc">
    <xsl:for-each select="limitmodifierssoc/limitmodifier">
      <xsl:sort select="name" />
      <br />&#160;&#160;&#160;<xsl:value-of select="name" />
      <xsl:if test="extra != ''"> (<xsl:value-of select="extra" />)</xsl:if>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="limitmodifiersast">
    <xsl:for-each select="limitmodifiersast/limitmodifier">
      <xsl:sort select="name" />
      <br />&#160;&#160;&#160;<xsl:value-of select="name" />
      <xsl:if test="extra != ''"> (<xsl:value-of select="extra" />)</xsl:if>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
