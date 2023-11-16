
## Create new document with reused value
Extract one element of an XML and insert it into another XML (or HTML) document.

```bash
xsltproc 1_rebuild/transform.xsl 1_rebuild/sample.xml
```

## Sanitize all spaces
Remove all spaces from an XML docuemnt values

```bash
xsltproc 2_sanitize/transform.xsl 2_sanitize/sample.xml
```

## Clean up XML
Remove one element based on it's content

```bash
xsltproc 3_exclude/transform.xsl 3_exclude/sample.xml
```

## Combine multiple XML files, using document function
You can use the xsltproc command-line tool to apply the XSLT transformation to the XML files. Here's how you can do it:

```bash
xsltproc 4_import/transform.xsl 4_import/sample-A.xml
```
This command will apply the `transform.xsl` stylesheet to the `sample-A.xml`  file. The `transform.xsl` stylesheet also loads the `transform-B.xml` file using the `document` function.

## Combine multiple XML files using pipe
You can concatenate multiple xsltproc executions using pipes (|) in the command line. The output of each command is used as the input for the next command.

```bash
xsltproc 5_pipe/transform-A.xsl 5_pipe/sample-A.xml | xsltproc 5_pipe/transform-B.xsl - > 5_pipe/output.xml
```

# Modify value, only if the field exists

```bash
xsltproc 6_modify/transform.xsl 6_modify/sample-A.xml

xsltproc 6_modify/transform.xsl 6_modify/sample-B.xml
```
This XSLT file will create a new XML document where the <status> of each employee is changed from "Active" to "Inactive". If the <status> field does not exist, it will not be added.

## Complex INPUT / OUTPUT

In a Datapower Gateway, serializing multiple XSLT transformations is a common usage. When this practice is used, the management of the input and output of each transformation can be a complicated task. This section will help you understand this piping by using the `xsltproc` command-line tool, mimicking the behavior of the Datapower Gateway.

#### Output to VARIABLE

Even though the XSLT processor inside the Datapower Gateway has specific functions to pass values to the main process variables (to outer scope, beyond the xslt boundaries) easing the usage of the transformation styelsheets, the `xsltproc` command-line tool does not have such a function. However, it's easy to replicate the behavior by using environment vars as follows.

You can extract one or multiple XML values without the indentation and other XML artifacts:
```bash
xsltproc 7_in_out/transform-A.xsl 7_in_out/sample.xml
```

From here, is easy to assign it to an environment variable:
```bash
some_var=$(xsltproc 7_in_out/transform-A.xsl 7_in_out/sample.xml)
```


#### Input from VARIABLE
The previous command can be concatenated with a second execution of 

```bash
some_var=$(xsltproc 7_in_out/transform-A.xsl 7_in_out/sample.xml) && xsltproc --stringparam envVar "$some_var" 7_in_out/transform-B.xsl 7_in_out/input.xml
```

The response should be:
```bash
<?xml version="1.0"?>
<new-element> Rescued message - Reminder: Don't forget me this weekend!</new-element>
```


#### Input from STDIN (INPUT / PIPE in IDG)
You can run `xsltproc` with the `-` parameter to read the input from the standard input (STDIN). This is the same as the `PIPE` source in the Datapower Gateway.

```bash
xsltproc 7_in_out/transform-B.xsl -
```

It will expect a valid XML document in the STDIN. Paste the one obtained previously:
```bash
<?xml version="1.0"?>
<new-element> Rescued message - Reminder: Don't forget me this weekend!</new-element>
```

Hit the CTRL+D keys followed by the ENTER key to send the EOF (End Of File) signal to the STDIN.
Now, you can concatenate the two commands as follows:
```bash
some_var=$(xsltproc 7_in_out/transform-A.xsl 7_in_out/sample.xml) && xsltproc --stringparam envVar "$some_var" 7_in_out/transform-B.xsl 7_in_out/input.xml | xsltproc 7_in_out/transform-C.xsl -
```