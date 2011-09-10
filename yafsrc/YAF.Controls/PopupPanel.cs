// --------------------------------------------------------------------------------------------------------------------
// <copyright file="PopupPanel.cs" company="">
//   
// </copyright>
// <summary>
//   The popup panel.
// </summary>
// --------------------------------------------------------------------------------------------------------------------

#region Copyright (c) 2010 Tiny Gecko

// <copyright file="this.cs" company="Tiny Gecko">
// </copyright>
#endregion

namespace YAF.Controls
{
	using System;
	using System.Web.UI;
	using System.Web.UI.WebControls;

	using YAF.Core;
	using YAF.Types;
	using YAF.Utils;

	/// <summary>
	/// The popup panel.
	/// </summary>
	public class PopupPanel : Panel
	{
		#region Constants and Fields


		#endregion

		#region Constructors and Destructors

		/// <summary>
		/// Initializes a new instance of the <see cref="PopupPanel"/> class.
		/// </summary>
		public PopupPanel()
		{
			this.Init += new EventHandler(this.PopupPanel_Init);
		}

		#endregion

		#region Properties

		/// <summary>
		///   Gets or sets Control.
		/// </summary>
		public string AttachToControl { get; set; }

		public bool AutoAttach
		{
			get
			{
				if (ViewState["AutoAttach"] == null)
				{
					return true;
				}

				return (bool)ViewState["AutoAttach"];
			}

			set
			{
				ViewState["AutoAttach"] = value;
			}
		}

		/// <summary>
		///   Gets ControlOnClick.
		/// </summary>
		public string ControlOnClick
		{
			get
			{
				return "yaf_popit('{0}')".FormatWith(this.ClientID);
			}
		}

		/// <summary>
		///   Gets ControlOnMouseOver.
		/// </summary>
		public string ControlOnMouseOver
		{
			get
			{
				return "yaf_mouseover('{0}')".FormatWith(this.ClientID);
			}
		}

		/// <summary>
		/// Gets InternalCssClass.
		/// </summary>
		protected virtual string InternalCssClass
		{
			get
			{
				return "yafpopuppanel";
			}
		}

		#endregion

		#region Methods

		/// <summary>
		/// The attach.
		/// </summary>
		/// <param name="ctl">
		/// The ctl.
		/// </param>
		public void Attach([NotNull] WebControl ctl)
		{
			ctl.Attributes["onclick"] = this.ControlOnClick;
			ctl.Attributes["onmouseover"] = this.ControlOnMouseOver;
		}

		/// <summary>
		/// The attach.
		/// </summary>
		/// <param name="userLinkControl">
		/// The user link control.
		/// </param>
		public void Attach([NotNull] UserLink userLinkControl)
		{
			userLinkControl.OnClick = this.ControlOnClick;
			userLinkControl.OnMouseOver = this.ControlOnMouseOver;
		}

		/// <summary>
		/// The render.
		/// </summary>
		/// <param name="writer">
		/// The writer.
		/// </param>
		protected override void Render([NotNull] HtmlTextWriter writer)
		{
			if (!this.Visible)
			{
				return;
			}

			var begin =
				string.Format(
					@"<div class=""{1}"" id=""{0}"" style=""position:absolute;z-index:100;left:0;top:0;display:none;"">", 
					this.ClientID, 
					this.InternalCssClass);

			writer.WriteLine(begin);

			this.RenderChildren(writer);

			writer.WriteLine("</div>");
		}

		protected override void OnPreRender(EventArgs e)
		{
			base.OnPreRender(e);

			if (this.AutoAttach && this.AttachToControl.IsSet())
			{
				var attachedControl = this.Parent.FindControl(this.AttachToControl) as Control;

				if (attachedControl != null && attachedControl is WebControl)
				{
					this.Attach(attachedControl as WebControl);	
				}
				else if (attachedControl != null && attachedControl is UserLink)
				{
					this.Attach(attachedControl as UserLink);
				}
			}

		}

		/// <summary>
		/// The pop menu_ init.
		/// </summary>
		/// <param name="sender">
		/// The sender.
		/// </param>
		/// <param name="e">
		/// The e.
		/// </param>
		private void PopupPanel_Init([NotNull] object sender, [NotNull] EventArgs e)
		{
			// init the necessary js...
			YafContext.Current.PageElements.RegisterJsResourceInclude("yafjs", "js/yaf.js");
		}

		#endregion
	}
}