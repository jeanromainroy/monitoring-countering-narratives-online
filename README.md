# Countering Narratives Online

A playbook for countering narratives on social media. Web-based report built using D3.js for data visualizations, and the Svelte framework.


## Prerequisites

You will need to have Node.js and NPM installed on your machine. 

        https://nodejs.org/en/download/


## Mise-en-place

1. Clone the repo on your machine

2. In the parent folder install the dependencies by running this command,

        npm i 

3. To "compile" the report run, 

        npm run build

4. You can now start the web server by running, 

        npm start

5. Open your browser and paste the following address to see your report,

        localhost:5555


## Updating the PGP key

Viewers might want to reach out by email. They can encrypt their message using the PGP public key displayed at 
the bottom of the page. 

Many tools are available to generate a new public/private key pair, encrypt a message using the public key, and 
decrypt the message using the private key. 

For testing purposes, you can use the online [pgptool](https://pgptool.org/). 

To update copy the public key [here](./public/files/pgp.pub.txt).


## Dev

### Configuration

Set your parameters in the [constants](./src/constants.json) file. 

In particular "CONDITIONS_FOR_POSTS_OF_INTEREST" that should define what constitutes a social media post of interest,

    CONDITIONS_FOR_POSTS_OF_INTEREST = [
        [ condition_1 AND condition_2 ] OR
        [ condition_3 ] OR
        [ condition_1 AND condition_4 ] OR
        ...
    ]


However, you will need to place the fonts in the root /assets/fonts/ directory of your server. 


### To serve through Tor

Install Tor,

        sudo apt update
        sudo apt install tor


Uncomment these two lines in the config file /etc/tor/torrc

        HiddenServiceDir /var/lib/tor/hidden_service/
        HiddenServicePort 80 127.0.0.1:80

Get the Onion address of your server by running

        sudo cat /var/lib/tor/hidden_service/hostname

For example, 

        en5kq3sxdasdasd212aoisdjaoifzu3kxtxvttrsbibaznpk4ljqd.onion

If you want modern browsers to offer the onion endpoint to visitor, set the onion location in your HTML,

        <meta http-equiv="onion-location" content="http://<your-onion-service-address>.onion" />


### Code Block

Here is the snippet of code to add a code block,

        // load components
        import CodeBlock from "../../components/CodeBlock.svelte";

        // let editor;
        const options = {
                mode: "javascript",
                lineNumbers: true,
                value: `function test() {\n  return 42\n}\n\nfunction test() {\n  return 42\n}`
        }

        <CodeBlock {options}/>


### Adding new fonts

[Google Fonts](https://fonts.google.com/) is a great resource to shop for fonts. 

Simply download the .ttf file to the [public fonts folder](./public/fonts/)

Then add the following snippet of code to the bottom of the [App file](./src/App.svelte)
 
        /* Custom Fonts */
        @font-face {
                font-family: '{FONT NAME}';
                font-style: normal;
                font-weight: 400;
                src: url('/fonts/{FILENAME}.ttf') format('truetype');
        }

You can then apply the font in your CSS

        font-family: '{FONT NAME}', sans-serif;


### Linting

To lint the src/ files use eslint

        npx eslint src/* --fix
        

### To deploy to S3

Here are the instructions to host the website inside an AWS S3 bucket.

1. Go to your [AWS S3 console](https://s3.console.aws.amazon.com/)

2. Click on "Create bucket", set the name and region, and make sure "Block all public access" is unchecked. Then, click on "Create Bucket".

3. Click on your bucket and then click on the "Permissions" tab

4. Edit "Bucket policy" and paste the following policy while making sure to replace {bucket_name} with the name of your bucket:

        {
            "Version": "2012-10-17",
            "Statement": [
                {
                    "Sid": "PublicRead",
                    "Effect": "Allow",
                    "Principal": "*",
                    "Action": "s3:GetObject",
                    "Resource": "arn:aws:s3:::{bucket_name}/*"
                }
            ]
        }

5. Click on "Save changes"

6. Click on the "Objects" tab and then click on "Upload"

7. Drag and drop all the content from the [public](./public/) folder of this repo and then click on "Upload"

8. Click on the "Properties" tab and scroll down to the "Static website hosting" section. Click on "Edit"

9. Enable Static website hosting, and set "index.html" as the Index document. Click on "Save changes"

10. Make sure everything works by clicking on the Bucket website endpoint


### To auto-update the S3 bucket when commits are pushed to github

