﻿using Com.PluginKernel;
using Ops.Cms;
using Ops.Cms.Core.Plugins;
using Ops.Cms.Web.WebManager;
using Ops.Plugin.NetCrawl;
using System;
using System.Web;

namespace sp.datapicker
{
    public class Plugin:IPlugin
    {
        private WebManage handler;

        public PluginConnectionResult Connect(IPluginHost _app)
        {
            IExtendApp app = _app as IExtendApp;
            if (app != null)
            {
                //注册
                app.Register(this, app_OnExtendModuleRequest, app_OnExtendModulePost);
                Cms.Plugins.MapExtendPluginRoute("admin/dpicker", app.GetAttribute(this).WorkIndent);
            }

            return PluginConnectionResult.Success;
        }

        private void app_OnExtendModulePost(HttpContext t, ref bool b)
        {
            int siteId = CmsWebMaster.CurrentManageSite.SiteId;
            if (siteId <= 0)
            {
                b = false; return;
            }
            string filePath = PluginUtil.GetAttribute(this).WorkSpace + "site_" + siteId.ToString() + ".conf";
            t.Handler = new CollectionExtend(Collector.Create(filePath));
            t.Handler.ProcessRequest(t);
            b = true;
        }

        private void app_OnExtendModuleRequest(HttpContext t, ref bool b)
        {
            int siteId = CmsWebMaster.CurrentManageSite.SiteId;
            if (siteId <= 0)
            {
                b = false; return;
            }
            string filePath = PluginUtil.GetAttribute(this).WorkSpace + "site_" + siteId.ToString() + ".conf";
            t.Handler = new CollectionExtend(Collector.Create(filePath));
            t.Handler.ProcessRequest(t);
            b = true;
        }

        public string GetMessage()
        {
            return "";
        }

        public bool Install()
        {
            return true;
        }

        public object Call(string method, params object[] parameters)
        {
            throw new NotImplementedException();
        }

        public void Pause()
        {
        }

        public void Run()
        {
        }

        public bool Uninstall()
        {
            return false;
        }
    }
}
