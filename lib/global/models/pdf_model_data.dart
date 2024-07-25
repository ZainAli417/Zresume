import 'package:zresume/global/models/pdf_model.dart';

PdfModel _pdfEmpty = PdfModel.createEmpty();

PdfModel pdfModelData = _pdfEmpty.copyWith(
  pdfId: '9ebe1243-de7a-4866-a006-35bcaa2d3b06',
  employment: [employmentSectionData],
  education: [educationSectionData],
  links: [linksData],
  activities: [activitySectionData],
  resumePersonal: personalData,
  resumeSummary: summary,
  skills: skillsData,
  languages: language,
  
);



Section employmentSectionData = const Section(
    sectionId: 'employmentSection',
    textOne: 'Flutter Developer',
    textTwo: 'ZBMTech Rawalpindi',
    textThree: 'Pakistan',
    startDate: 'JUNE 2024',
    endDate: 'PRESENT',
    description:
        'With a profound expertise in Cyber Security, Web Development, and Mobile App Development, I am a dedicated professional committed to continuous learning and technological advancement. As a native Linux user, I specialize in network security configurations and Windows troubleshooting. My proficiency extends to web and Android development, particularly in Flutter app development, where I craft exceptional digital experiences. Certified by Google, IBM, Coursera, Meta and EC-Council, I excel in IT support and virtual machine installation using Hyper-V and Sandbox environments. Proficient in MS Office 365 products, I streamline operations and drive productivity. My professional journey is driven by a passion for crafting exceptional digital experiences and a dedication to delivering results that exceed expectations. I thrive on challenges and am enthusiastic about tackling new projects and embracing innovative solutions.');

Section activitySectionData = const Section(
    sectionId: 'activitySection',
    textOne: 'Blogger',
    textTwo: 'Blogspot Inc.',
    textThree: 'Pakistan',
    startDate: 'AUG 2022',
    endDate: 'SEP 2022',
    description:
        'I have Created a Blog to help new upcoming students to have a brief overview for the past papers, curriculum and courses offered by university.Visit https://aridpastpaper.blogspot.com');

Section educationSectionData = const Section(
    sectionId: 'educationSection',
    textOne: 'PMAS Arid Agriculture University of Rawalpindi',
    textTwo: 'Bachelor of Computer Science',
    textThree: 'Pakistan',
    startDate: 'OCT 2020',
    endDate: 'OCT 2024',
    description:
        'I graduated with BS(Hons.) in  Computer Science , during this undergraduate program I learned different development frameworks like ASP.NET for the web, Java for mobile, C-Sharp for creating a desktop application. Along with this I also learned to use database and server managing software like XAMP,SQL,MONGODB.');

Summary summary = const Summary(
    professionalSummary:
        'I am a motivated CS graduate looking forward to expanding my knowledge and career in the IT sector. Along with that, I want to experience working with professionals in the field so that I am able to stay up-to-date and learn the best practices that should be used while working in the IT sector. As for me, some of my greatest strengths are communicating and working alongside my peers.');

Personal personalData = const Personal(
  firstName: 'Zain',
  lastName: 'Ali',
  jobTitle: 'Flutter App Developer',
  email: 'alimalik20102019@gmail.com',
  phoneNumber: '+923196051338',
);

Links linksData =
    const Links(linksId: '01', linkName: 'Linkedin', linkUrl: 'https://www.linkedin.com/in/zainali417');

List<Skill> skillsData = const [
  Skill(skillId: '01', skillName: "Flutter"),
  Skill(skillId: '02', skillName: "Dart"),
  Skill(skillId: '03', skillName: "C#"),
  Skill(skillId: '04', skillName: "Firebase"),
  Skill(skillId: '05', skillName: "SQL"),
  Skill(skillId: '06', skillName: "Python"),
  Skill(skillId: '07', skillName: "Java"),
  Skill(skillId: '08', skillName: "Javascript"),
  Skill(skillId: '09', skillName: "Shell Scripting"),
  Skill(skillId: '10', skillName: "White Labeling and Error Solving"),
];

List<Skill> language = const [
  Skill(skillId: '01', skillName: "English"),
  Skill(skillId: '02', skillName: "Urdu"),
  Skill(skillId: '03', skillName: "Turkish"),
];
