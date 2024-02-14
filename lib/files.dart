String version_number = "3.0.0";
String build_number = "Flutter web";

String randomizerBG = "assets/images/light21.jpg";
String sequencerBG = "assets/images/light21.jpg";
String fragmentBG = "assets/images/light21.jpg";
String treasureBG = "assets/images/light21.jpg";
String futureBG = "assets/images/light21.jpg";

const Map<int, List<double>> chaosLong = {
  1: [1.2, 2.4],
  2: [1.1, 1.7],
  3: [0.8, 1.4],
  4: [0.6, 1.2],
  5: [0.3, 0.5],
  6: [0.2, 0.3],
};
const Map<int, List<double>> chaosShort = {
  1: [0.40, 0.50],
  2: [0.25, 0.30],
  3: [0.20, 0.25],
  4: [0.15, 0.20],
  5: [0.12, 0.15],
  6: [0.08, 0.12],
};

var allFragments = {
  'R': 'R',
  'so': 'so',
  'for tose': 'for_tose',
  'oaic': 'oaic',
  'oh no cannot': 'oh_no_cannot',
  "ah yong ah": "ah_x3_2011",
  "challenge me": "challenge_me_2012",
  "how much gain": "how_much_we_can gain_2011",
  "observation right": "observation_right_2012",
  "confidence question": "question_confidence_2011",
  "robusness": "robusness_2012",
  "precision": "precision_2012",
  "should zero": "should_be_zero_2011",
  "this code": "this_just_the_code_2012",
  "two foldous": "two_foldous_2012",
  "which prefier": "which_prefier_2011",
  "yeah yea": "yeab_yea_2011",
  'work on airphone': 'work_on_airphone',
  'wawa correlation': 'wawa_correlation',
  'volcano': 'volcano',
  'to implement': 'to_implement',
  'surch pdf': 'surch_pdf',
  'simple toy': 'simple_toy',
  'separate result': 'separate_better_result',
  'r is powerful': 'r_powerful',
  'oh yea of course': 'oh_yea_ofcourse',
  'maikin': 'maikin',
  'free': 'free',
  'hold trunk': 'hold_trunk',
  'stand here': 'stand_here',
  'minor functions': 'minor_functions',
  'what is R': 'what_is_r',
  'surched': 'surched',
  "can't deal with that": 'cant_deal_with_that',
  "don't emember": 'dont_member',
  'not always true': 'not_always_true',
  "but that's okay": 'but_thats_okay',
  'no one everything': 'no_people_everything',
  'idky but message': 'idky_but_message',
  'vely confuse': 'sometime_very_confuse',
  'not satisferred': 'satisferred',
  'lid bid high': 'lid_bid_high',
  'mentioned bid hi': 'mentioned_bid_hi',
  'ideal huge data': 'ideal_huge_data',
  'huge data': 'huge_data',
  'the idea simple': 'the_idea_simple',
  'pretty simple': 'pretty_simple',
  'seems simple': 'seems_simple',
  'theoretical ofcourse': 'theoretical_of_course',
  "don't needo": 'dont_needo_do_that',
  'long lasso': 'long_laso',
  'short lasso': 'short_laso',
  'short lasso 2': 'short_laso_2',
  'short lasso 3': 'laso3',
  'short lasso 4': 'laso4',
  'we just use R': 'we_just_use_r',
  'close to four': 'close_four',
  'close to six': 'close_six',
  'predicture rate': 'predicture_rate',
  'make ah notes': 'make_a_notes',
  'honbanation': 'honbanation',
  'likelikoot function': 'likelikoot_function',
  'call y whatever': 'call_y_whatever',
  'linear but none': 'linear_but_none',
  'ic50 ec50': 'ic50_ec50',
  'help min': 'help_min',
  'good question': 'good_question',
  'excited result': 'excited_result',
  'drug affinity': 'describe_drug_affinity',
  'cannot necassary': 'cannot_necassary',
  'suppose': 'suppose',
  'once used R': 'once_used_r',
  'take a nap': 'take_a_nap',
  'R for everything': 'r_for_everything',
  'smoothie': 'smoothie',
  'boostra': 'boostra',
  'deepist': 'deepist',
  'one of concern': 'one_of_concern',
  'for instance ah': 'for_instance_ah',
  'let me show you': 'let_me_show_you',
  'nonlinear': 'nonlinear',
  'who know this': 'who_know_right',
  'as you know': 'as_you_know',
  'one plus one': 'one_plus_one',
  'nuke like likelikoot': 'nuke_like_likelikoot',
  'it seems ah': 'it_seems_ah',
  'bvb': 'bvb',
  'that means': 'that_means',
  'doable': 'all_you_know_doable',
  'oh okay': 'oh_okay',
  'basic idea is': 'basic_idea_is',
  'k minimize aic': 'k_minimize_aic',
  'we we expect': 'we_we_expect',
  'open questions': 'open_questions',
  'finally': 'we_finally_ah',
  '5 we ah': 'five_we_ah',
  'very big right': 'very_big_right',
  'operate yourself': 'operate_by_yourself',
  'not for just R': 'not_for_just_r',
  'then have idea': 'then_have_idea',
  'choose weight': 'choose_weight',
  'and so on': 'and_so_on',
  '10k genes': '10k_gene_exp',
  'in terms of': 'in_terms_of',
  'and': 'and',
  'times too fa': 'times_too_fa',
  'enough time': 'enough_time',
  'big p': 'show_you_big_p',
  'aic bic': 'aicbic',
  'v shape': 'v_shape',
  'u shape': 'u_shape',
  'okay stop ty': 'okay_stop_ty'
};

// Sequencer playlists.
List<String> surchedPL = [
  "surched",
  "what is R",
  "R for everything",
  "hold trunk",
  "stand here"
];
List<String> confusePL = [
  "likelikoot function",
  "honbanation",
  "vely confuse",
  "but that's okay"
];
List<String> oneplusonePL = [
  "not always true",
  "as you know",
  "one plus one",
  "nuke like likelikoot"
];
List<String> deepistPL = ["smoothie", "boostra", "deepist"];
List<String> ememberPL = ["free", "maikin", "don't emember"];
List<String> simplePL = ["the idea simple", "pretty simple", "seems simple"];
List<String> lasoPL = [
  "long lasso",
  "short lasso",
  "short lasso 2",
  "short lasso 3",
  "short lasso 4"
];
List<String> needodoPL2 = ["theoretical ofcourse", "don't needo"];
List<String> hugePL = [
  "basic idea is",
  "k minimize aic",
  "we we expect",
  "5 we ah",
  "not satisferred",
  "ideal huge data",
  "huge data"
];
List<String> callyPL = [
  "call y whatever",
  "idky but message",
  "open questions"
];
List<String> meansdoablePL = ["that means", "doable"];
List<String> operationPL = [
  "operate yourself",
  "then have idea",
  "not for just R",
  "don't needo",
  "theoretical ofcourse"
];
List<String> timePL = [
  "times too fa",
  "enough time",
  "make ah notes",
  "big p",
  "nonlinear"
];
List<String> foursixPL = [
  "very big right",
  "choose weight",
  "close to six",
  "close to four",
  "in terms of",
  "10k genes"
];
List<String> hiPL = [
  "for instance ah",
  "minor functions",
  "lid bid high",
  "mentioned bid hi",
  "who know this"
];
// All playlists.
List<List<String>> allPlaylists = [
  surchedPL,
  confusePL,
  oneplusonePL,
  deepistPL,
  ememberPL,
  simplePL,
  lasoPL,
  timePL,
  callyPL,
  meansdoablePL,
  operationPL,
  hugePL,
  hiPL,
  foursixPL,
  needodoPL2,
];
