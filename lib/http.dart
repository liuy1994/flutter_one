const String API = 'https://jiasule.v2ex.com/api/';

const String SITE_INFO = API + 'site/info.json';
// 取网站信息
// @GET
// {
//   "title" : "V2EX",
//   "slogan" : "way to explore",
//   "description" : "创意工作者们的社区",
//   "domain" : "www.v2ex.com"
// }

const String TOPICS_LATEST = API + 'topics/latest.json';
// 取网站状态
// @GET
// {
//   "topic_max" : 126172,
//   "member_max" : 71033
// }

const String TOPICS_HOT = API + 'topics/hot.json';

const String TOPIC_DETAIL = API + 'topics/show.json';

const String TOPIC_REPLY = API + 'replies/show/.json';
// 取主题回复
// @GET
// @param topic_id
// @param page
// @param page_size

const String MEMBER_INFO = API + 'member/show.json';
// 取用户信息
// @GET
// @param username
