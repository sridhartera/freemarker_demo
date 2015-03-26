<?xml version="1.0" encoding="UTF-8"?>
<assetInteractiveFeatureRequest action="add" audit="" service="HBO" tkey="${lookup_prop.ASSET_TKEY}" type="ASSET" user="" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="AssetInteractiveFeatureRequest.xsd">
  <interactiveFeatures>
	<#list ive_feature.feature_metadata.device as ivfeature>
	  <interactiveFeature>
	  <#assign device_code="${ivfeature.devicecode}">
	  <#assign lookup_deviceid_key="${device_code}.id">
	  <#assign lookup_deviceid="${lookup_prop[lookup_deviceid_key] !''}">
	  <#--
    	lookup prop: "${lookup_prop['DESKTOP.id']}"
    	lookup prop: ${lookup_prop[lookup_deviceid]}
      -->
	  <@masterAction device_id=lookup_deviceid />
	  	  <id>${lookup_deviceid}</id>
		  <interactiveFeatureType>${ivfeature.typecode}</interactiveFeatureType>
		  <talentName>${ivfeature.talentname !''}</talentName>
		  <talentTwitterName>${ivfeature.talenttwittername !''}</talentTwitterName>
		  <deviceCode>${device_code}</deviceCode>
		  <browseMetadataLocations>
			<#list ivfeature.externalcontentlocations as metadata>
			  <#assign meta_type="${metadata.type}">
			  <#assign lookup_meta_id_key="${device_code}.browseMetadata.${meta_type}">
			  <#assign lookup_meta_id="${lookup_prop[lookup_meta_id_key] !''}">
			  <#if master_action_item!="ADD">
			    <@action lookupid=lookup_meta_id />
			  </#if>
			  <browseMetadata action="${action_item}">
				<id>${lookup_meta_id}</id>
				<type>${meta_type}</type>
				<url><@updateLocation location="${metadata.location}" updated_location="/modified/location"/></url>
			  </browseMetadata>
			</#list>
		  </browseMetadataLocations>
		  <alerts>
			<#list ivfeature.alerts as ivfalert>
			  <#assign alert_starttime="${ivfalert.starttime}">
			  <#assign lookup_alert_id_key="${device_code}.alerts.${alert_starttime}">
			  <#assign lookup_alert_id="${lookup_prop[lookup_alert_id_key] !''}">
			  <#if master_action_item!="ADD">
			    <@action lookupid=lookup_alert_id />
			  </#if>
			  <alert action="${action_item}">
				<id>${lookup_alert_id}</id>
				<startTime>${ivfalert.starttime}</startTime>
				<stopTime>${ivfalert.endtime}</stopTime>
				<title>${ivfalert.title}</title>
				<twitterName>${ivfalert.twittername !''}</twitterName>
				<description>${ivfalert.description !''}</description>
				<themeClass>${ivfalert.themeclasscode !''}</themeClass>
		        <images>
		          <#assign alert_sfimage="${ivfalert.alertimage_location}">
			      <#assign lookup_alert_sfimage_key="${device_code}.alerts.${alert_starttime}.images.SF_IMAGE">
			      <#assign lookup_alert_sfimage_id="${lookup_prop[lookup_alert_sfimage_key] !''}">
        	   	  <image>
          		    <id>${lookup_alert_sfimage_id}</id>
          		    <imageClass>${ivfalert.imageclass !''}</imageClass>
          		    <previousImageClass>${ivfalert.previousimageclass !''}</previousImageClass>
          		    <type>SF_IMAGE</type>
          		    <title>${ivfalert.title !''}</title>
          		    <did>${ivfalert.did !''}</did>
          		    <fileName>${ivfalert.alertimage_location !''}</fileName>
          		    <focusId>${ive_feature.feature_metadata.focusid}</focusId>
          	      </image>
          	      <#assign alert_takeoverImage="${ivfalert.alertimage_location}">
			      <#assign lookup_alert_takeoverImage_key="${device_code}.alerts.${alert_starttime}.images.SF_TAKEOVER">
			      <#assign lookup_alert_takeoverImage_id="${lookup_prop[lookup_alert_takeoverImage_key] !''}">
        	   	  <image>
          		    <id>${lookup_alert_takeoverImage_id}</id>
          		    <imageClass>${ivfalert.imageclass !''}</imageClass>
          		    <previousImageClass>${ivfalert.previousimageclass !''}</previousImageClass>
          		    <type>SF_TAKEOVER</type>
          		    <title>${ivfalert.title !''}</title>
          		    <did>${ivfalert.did !''}</did>
          		    <fileName>${ivfalert.takeover_location !''}</fileName>
          		    <focusId>${ive_feature.feature_metadata.focusid}</focusId>
          	      </image>
          	    </images>
                <videoClips>
	               <#assign alert_videoclipclass="${ivfalert.videoclipclass !''}">
				   <#assign lookup_alert_videoclipclass_id_key="${device_code}.alerts.${alert_starttime}.videos.videoClipClass !''">
				   <#assign lookup_alert_videoclipclass_id="${lookup_prop[lookup_alert_videoclipclass_id_key] !''}">
          	       <videoClip>
          		   <id>${lookup_alert_videoclipclass_id}</id>
          		   <videoClipClass>${ivfalert.videoclipclass !''}</videoClipClass>
          		   <previousVideoClipClass>${ivfalert.previousvideoclipclass !''}</previousVideoClipClass>
          		   <title>${ivfalert.title !''}</title>
          		   <did>${ivfalert.did !''}</did>
          		   <fileName>${ivfalert.video_location !''}</fileName>
          		   <focusId>${ive_feature.feature_metadata.focusid}</focusId>
          	     </videoClip>
          	   </videoClips>
              </alert>
			</#list>
		  </alerts>
	  </interactiveFeature>
	</#list>
  </interactiveFeatures>
</assetInteractiveFeatureRequest>

<#-- starting macros -->

<#macro updateLocation location updated_location>
 ${updated_location}/${location} <#rt>
</#macro>

<#macro masterAction device_id>
  <#if device_id !="null">
    <#assign master_action_item="UPDATE">
    <#assign action_item="update">
    <#-- master action item: ${master_action_item} -->
  <#else>
    <#assign master_action_item="ADD">
    <#assign action_item="add">
    <#-- master action item: ${master_action_item} -->
  </#if>
</#macro>

<#macro action lookupid>
  <#if lookupid != "">
    <#assign action_item="update">
    <#-- action item from macro action: ${action_item} -->
  <#else>
    <#assign action_item="add">
    <#-- action item from macro action: ${action_item} -->
  </#if>
</#macro>
