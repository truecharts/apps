
# Homepage TrueCharts integration guide  

TrueCharts has adopted HomePage for it defacto dashboard application due to its support of kubernetes  

This Guide will cover how to use the TrueCharts/Homepage integration included in the chart and the editing of the yaml files in homepage using the code-server addon. this guide will not cover every aspect of options available to homepage. Please see the Homepage links below for more information  

⚠️ In order for Homepage to "discover" your apps, Ingress is required using our ingress configuration guidelines and the integration options for the chart configuration. Otherwise all kubernetes features can be used with manual configuration of homepage via its configuration yaml files⚠️  

## Homepage Links  

Github: <https://github.com/gethomepage/homepage>  
WebSite <https://gethomepage.dev/>  

### Getting Started  

   Install Truecharts Homepage and enable code-server addon. for this guide i'll just be using ip:port
  ![code-server section](img/image.png)

  put in the IP:port in to your browser. the IP will depend on your setup but usually the scale IP  

  once in code server under app/config you will see the following files these will allow you to manipulate many aspects. but first we will turn on homepage kube support by editing kubernetes.yaml  

  For Scale users you will enter ```mode:default``` Native Kubernetes & Helm users may need to user ```mode:cluster```  which will use a service account  
  
![kube yaml edit](img/kubeyml.png)

<details>
<summary> ⚠️ Advanced Section regarding metrics server for Scale users⚠️ </summary>  

If you wish to make user of the metrics components of homepage you can enable the metrics server in cobia, currently there is no gui option for this but should be in a future release. as such this does fall under advanced. its advised to make a backup before running the following command. this command will force all your apps to restart, its a good idea to do a stop-all on any CNPG apps as they don't always like when the apps cycle as a result of this command.  

```midclt call -job kubernetes.update '{"metrics_server": true}'```

you can then run ```k3s kubectl top pods -A``` once all apps have resumed to confirm the metrics server is running properly  

You can then add the following to you widgets.yaml file to  add the cluster/node resources display

```yaml
- kubernetes:
    cluster:
      # Shows cluster-wide statistics
      show: true
      # Shows the aggregate CPU stats
      cpu: true
      # Shows the aggregate memory stats
      memory: true
      # Shows a custom label
      showLabel: true
      label: "cluster"
    nodes:
      # Shows node-specific statistics
      show: false # Set to True in Clusters kubernetes environments 
      # Shows the CPU for each node
      cpu: true
      # Shows the memory for each node
      memory: true
      # Shows the label, which is always the node name
      showLabel: true
```  

which will result in the following being added  
![hp kube enable check](img/hpenablechck.png)  

and you will be able to have outputs similar to this to see mem and CPU  

![metrics example](img/metricsexample.png)

:exclamation:Due to how Homepage calculates utilization for your applications this is only an approximation. the percentage is not based on your Physical CPU utilization but based on the max cpu limit for the chart, and is additive for each pod. if your chart has 2000m for the cpu limit and has 1 pod 1000m of usage will read 50%,  if the chart has 2 pods each with 2000m limit it will read 25% for 1000m of usage as the pods total 4000m. Ram utilization is the total combined ram usage across all pods

</details>
<br>
We can now enable our first integration!

### Enabling Integration in charts  

Edit and existing chart with ingress and go to the ingress section and enable the homepage integration checkbox  

:white_check_mark:Name can be left blank or use the name of your choice.  
:white_check_mark:Description can be left blank or you can use the description of your choice  
:exclamation: Group is important and required it will allow you to group the different apps together so for example all your media apps you may want in a group called "Media" you can also use the group names you may have already defined in services.yaml and it will add the discovered app to that group
:exclamation: Api Key is where you will enter an api key for your application if needed, if this is a new install and you do not have an api key yet, you can come back and add this  
:white_check_mark: adding custom options will allow you to add fields to the widget. or define username/password when there is no API key to apply. you can see the various fields available in the widgets section of the homepage documentation at their site above

![integration options](img/intop.png)

which results in the following in Homepage,  

![example one](img/exmaple1.png)  

As you can see the application is running and you can see the fields have populated.  

You may also notice in the above screenshot that homepage has a message "Missing Widget Type: homepage"  At this time you will have to define applications with out widgets manually in services.yaml  
If you see this message on an application that has a widget per the homepage documentation. please submit a github bug request to us so that we may correct the type setting.  

If you have turned on the metrics server in the above section. you can click running to see the applications approximate utilization.

![utilization example](img/utilexam.png)  


you can also use settings.yaml to change the group layout from a single column to rows (with up to 5 columns per row ) and other settings

### Known issues and Limitations
  
- When Using the integration to detect your apps, applications may change places with in the group on each restart of homepage as it populates in the order it detects the application  
- Some Applications may have incorrect widget type
- When using the integration you will not be able to control settings on a per app basis as far as auto showing/hiding stats or chaining the status indicator or adding a ping with ms response time readout
- External Services does have the options for integration but may not be fully functional  
- Applications that have different names from their default (IE second deployments) may not fully work at this time.  
