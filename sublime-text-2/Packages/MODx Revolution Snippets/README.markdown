# MODx Sublime Text 2 Bundle

This bundle aims to provide most of MODx functionality and featues when creating Custom Manager Pages.

Here is a list of triggers currently setup and in their own context.

#### ExtJS - source.js

trigger: extExtend

	Ext.extend(MyClass.window.Name, ClassToExtend, {});

trigger: extReg

	Ext.reg('myclass-window-name', MyClass.window.Name);

trigger: extText

	{
		xtype: 'textfield'
		,fieldLabel: 'label'
		,name: 'name'
		,anchor: '100%'
	}

trigger: extFun

	Namespace.window/grid/panel/tree/page/combo/config.ClassName = function (config) {
		config = config || {};
		Ext.applyIf(config, {
			title: 'title'
			,url: connectorUrl
			,fileUpload: true
			,baseParams: {
				action: 'create'
			}
			,fields: []
		});
		Namespace.window/grid/panel/tree/page/combo/config.ClassName.superclass.constructor.call(this, config);
	};

#### xPDO - text.xml

trigger: aggregate

	<aggregate alias="Alias" class="ClassName" local="local" foreign="id" cardinality="one|many" owner="foreign|local" />

trigger: composite

	<composite alias="Alias" class="ClassName" local="local" foreign="id" cardinality="one|many" owner="foreign|local" />

trigger: field
	
	<field key="name" dbtype="varchar" precision="160" attributes="unsigned" phptype="string" null="false" default="" />

trigger: model

	<model package="ClassName" baseClass="xPDOObject" platform="mysql" defaultEngine="MyISAM">
	
	</model>

trigger: object

	<object class="ClassName" table="table_name" extends="xPDOSimpleObject">
		<field key="name" dbtype="varchar" precision="160" attributes="unsigned" phptype="string" null="false" default="" />
	</object>