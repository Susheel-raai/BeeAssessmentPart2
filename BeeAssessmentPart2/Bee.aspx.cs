using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BeeAssessmentPart2
{
    /// <summary>
    /// this page create a single list containing 10 instances of each type of Bee.
    /// Calls Damage() for each click action and return the health status of each bee, including whether it is alive or not.
    /// </summary>
    public partial class Bee : System.Web.UI.Page
    {
        public class BeeModel
        {
            public int index { get; set; }
            public float health { get; set; }
            public string healthStatus { get; set; }
        }

        /// <summary>
        /// an initial method executed once the request passed from browser.
        /// if block executed if the request is not IsPostBack request.
        /// initalise the values to all the ten instanvces of each type of bee.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<BeeModel> beeList = new List<BeeModel>();

                for (int i = 1; i <= 10; i++)
                {
                    beeList.Add(new BeeModel { index = i - 1, health = 100, healthStatus = "Alive" });
                }

                WorkerBee_ListView.DataSource = beeList;
                WorkerBee_ListView.DataBind();

                QueenBee_ListView.DataSource = beeList;
                QueenBee_ListView.DataBind();

                DroneBee_ListView.DataSource = beeList;
                DroneBee_ListView.DataBind();
                initialiseTab();
            }
        }

        /// <summary>
        /// setting default tab once the request is not IsPostBack request.
        /// </summary>

        public void initialiseTab()
        {
            Tab1.CssClass = "Clicked";
            Tab2.CssClass = "Initial";
            Tab3.CssClass = "Initial";
            MainView.ActiveViewIndex = 0;
        }


        protected void Tab1_Click(object sender, EventArgs e)
        {
            initialiseTab();
        }


        /// <summary>
        /// switching to tab 2 on click action
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Tab2_Click(object sender, EventArgs e)
        {
            Tab1.CssClass = "Initial";
            Tab2.CssClass = "Clicked";
            Tab3.CssClass = "Initial";
            MainView.ActiveViewIndex = 1;
        }

        /// <summary>
        /// switching to tab 3 on click action
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Tab3_Click(object sender, EventArgs e)
        {
            Tab1.CssClass = "Initial";
            Tab2.CssClass = "Initial";
            Tab3.CssClass = "Clicked";
            MainView.ActiveViewIndex = 2;
        }


        /// <summary>
        /// method invokes when damage button is clicked for worker bee
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void WorkerBeeCommand_Damage(object sender, CommandEventArgs e)
        {
            float healthLimit = 70.0f;
            int selectIndex = int.Parse(e.CommandArgument.ToString());

            UpdateHealthandStatus(WorkerBee_ListView, healthLimit, selectIndex);
        }


        /// <summary>
        /// method invokes when damage button is clicked for Queen bee
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void QueenBeeCommand_Damage(object sender, CommandEventArgs e)
        {
            float healthLimit = 20.0f;
            int selectIndex = int.Parse(e.CommandArgument.ToString());

            UpdateHealthandStatus(QueenBee_ListView, healthLimit, selectIndex);
        }

        /// <summary>
        /// method invokes when damage button is clicked for Drone bee
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void DroneBeeCommand_Damage(object sender, CommandEventArgs e)
        {
            float healthLimit = 50.0f;
            int selectIndex = int.Parse(e.CommandArgument.ToString());

            UpdateHealthandStatus(DroneBee_ListView, healthLimit, selectIndex);
        }

        /// <summary>
        /// calculate a damage of each bee based on damage value 
        /// </summary>
        /// <param name="health"></param>
        /// <param name="healthLimit"></param>
        /// <param name="DamageValue"></param>
        /// <returns> Returns health value of type float</returns>

        public float Damage(float health, float healthLimit, int DamageValue)
        {
            if (health < healthLimit)
            {
                return health;
            }
            float damagePercentage = ((float)DamageValue / 100) * health;
            health = health - damagePercentage;
            return health;
        }


        /// <summary>
        /// Update health and status of the corresponding based on the randomly generated value on user button click action.
        /// </summary>
        /// <param name="listView"></param>
        /// <param name="healthLimit"></param>
        /// <param name="selectIndex"></param>
        public void UpdateHealthandStatus(ListView listView, float healthLimit, int selectIndex)
        {
            Random random = new Random();
            int randnum = random.Next(0, 80);

            Label healthlbl = (Label)listView.Items[selectIndex].FindControl("healthIDLabel");
            Label healthStatuslbl = (Label)listView.Items[selectIndex].FindControl("healthStatusIDLabel");

            float health = float.Parse(healthlbl.Text);
            float currentHealth = Damage(health, healthLimit, randnum);

            healthlbl.Text = currentHealth.ToString();
            healthStatuslbl.Text = currentHealth < healthLimit ? "Dead" : "Alive";
        }
    }
}