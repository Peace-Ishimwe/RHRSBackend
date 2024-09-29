import nodemailer from 'nodemailer';

const mailSender = async (email: string, title: string, body: string) => {
    try {
        // Create a Transporter to send emails
        let transporter = nodemailer.createTransport({
            host: process.env.MAIL_HOST,
            port: parseInt(process.env.MAIL_PORT as string),
            secure: false,
            auth: {
                user: process.env.MAIL_USER,
                pass: process.env.MAIL_PASS,
            },
            from: process.env.MAIL_USER,
        });
        // Send emails to users
        let info = await transporter.sendMail({
            from: process.env.MAIL_USER,
            to: email,
            subject: title,
            html: body,
            text: "UzaboxForms"
        });
        return info;
    } catch (error: any) {
        console.log(error);
    }
};

export default mailSender;