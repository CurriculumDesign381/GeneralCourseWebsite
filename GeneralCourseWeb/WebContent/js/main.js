/**
 * Created by Founder007 on 2017/10/13.
 */
$(function() {
	// 动态菜单数据
	var treeData = [ {
		text : "所有栏目",
		state : "closed",
		children : [ {
			text : "首页",
			state : "",
			attributes : {
				url : "http://www.baidu.com"
			}
		}, {
			text : "课程介绍",
			attributes : {
				url : "http://www.baidu.com"
			}
		}, {
			text : "教学团队",
			attributes : {
				url : "http://www.baidu.com"
			}
		}, {
			text : "课程建设",
			attributes : {
				url : "http://www.baidu.com"
			}
		}, {
			text : "课程资源",
			attributes : {
				url : "http://www.baidu.com"
			}
		}, {
			text : "问题与答疑",
			attributes : {
				url : "http://www.baidu.com"
			}
		}, {
			text : "课程研究",
			attributes : {
				url : "http://www.baidu.com"
			}
		} ]
	} ]

	// 实例化树形菜单
	$("#tree").tree({
		data : treeData,
		lines : true,
		onClick : function(node) {
			if (node.attributes) {
				Open(node.text, node.attributes.url);
			}
		}
	});
	// 在右边center区域打开菜单，新增tab
	function Open(text, url) {
		window.location.href = url;
	}

	// 绑定tabs的右键菜单
	$("#tabs").tabs({
		onContextMenu : function(e, title) {
			e.preventDefault();
			$('#tabsMenu').menu('show', {
				left : e.pageX,
				top : e.pageY
			}).data("tabTitle", title);
		}
	});

	// 实例化menu的onClick事件
	$("#tabsMenu").menu({
		onClick : function(item) {
			CloseTab(this, item.name);
		}
	});

	// 几个关闭事件的实现
	function CloseTab(menu, type) {
		var curTabTitle = $(menu).data("tabTitle");
		var tabs = $("#tabs");

		if (type === "close") {
			tabs.tabs("close", curTabTitle);
			return;
		}

		var allTabs = tabs.tabs("tabs");
		var closeTabsTitle = [];

		$.each(allTabs, function() {
			var opt = $(this).panel("options");
			if (opt.closable && opt.title != curTabTitle && type === "Other") {
				closeTabsTitle.push(opt.title);
			} else if (opt.closable && type === "All") {
				closeTabsTitle.push(opt.title);
			}
		});

		for (var i = 0; i < closeTabsTitle.length; i++) {
			tabs.tabs("close", closeTabsTitle[i]);
		}
	}
});