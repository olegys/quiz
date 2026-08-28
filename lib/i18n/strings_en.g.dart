///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations

	/// en: 'QuizBattle'
	String get appName => 'QuizBattle';

	/// en: 'Loading...'
	String get loading => 'Loading...';

	/// en: 'QuizBattle:'
	String get quizBattle => 'QuizBattle:';

	/// en: 'Bet on knowledge'
	String get betOnKnowledge => 'Bet on knowledge';

	/// en: 'Create your own games, choose themes, difficulty levels, and number of questions. Play and bet on your knowledge. Track your stats, unlock achievements, and climb to the top of the experts!'
	String get createYourOwnGames => 'Create your own games, choose themes, difficulty levels, and number of questions. Play and bet on your knowledge.\nTrack your stats, unlock achievements, and climb to the top of the experts!';

	/// en: 'Let’s Go!'
	String get letsGo => 'Let’s Go!';

	/// en: 'Welcome back, Genius'
	String get welcomeBackGenius => 'Welcome back, Genius';

	/// en: 'Your'
	String get your => 'Your';

	/// en: 'victory is right'
	String get victoryIsRight => 'victory is right';

	/// en: 'here! Just prove it to'
	String get hereJustProveItTo => 'here! Just prove it to';

	/// en: 'yourself'
	String get yourself => 'yourself';

	/// en: 'Win Rate'
	String get winRate => 'Win Rate';

	/// en: 'Loss Rate'
	String get lossRate => 'Loss Rate';

	/// en: 'Total Done'
	String get totalDone => 'Total Done';

	/// en: 'Achievements'
	String get achievements => 'Achievements';

	/// en: 'Start Game'
	String get startGame => 'Start Game';

	/// en: 'Settings'
	String get settings => 'Settings';

	/// en: 'Buzz Settings'
	String get buzzSettings => 'Buzz Settings';

	/// en: 'Send to Friends'
	String get sendToFriends => 'Send to Friends';

	/// en: 'Tell Us What You Think'
	String get tellUsWhatYouThink => 'Tell Us What You Think';

	/// en: 'Show Some Love'
	String get showSomeLove => 'Show Some Love';

	/// en: 'Player Privacy'
	String get playerPrivacy => 'Player Privacy';

	/// en: 'Reset My Journey'
	String get resetMyJourney => 'Reset My Journey';

	/// en: 'Are you sure you want to reset your statistics and achievements? After resetting, all progress will be lost.'
	String get areYouSureYouWantToReset => 'Are you sure you want to reset your statistics and achievements?\nAfter resetting, all progress will be lost.';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'Reset'
	String get reset => 'Reset';

	/// en: '${icon} Version App: ${version}'
	String versionApp({required Object icon, required Object version}) => '${icon} Version App: ${version}';

	/// en: 'Number of Questions'
	String get numberOfQuestions => 'Number of Questions';

	/// en: 'Select Category'
	String get selectCategory => 'Select Category';

	/// en: 'Select Difficulty'
	String get selectDifficulty => 'Select Difficulty';

	/// en: 'Select Type'
	String get selectType => 'Select Type';

	/// en: 'Quiz Option'
	String get quizOption => 'Quiz Option';

	/// en: 'Fill in all the parameters to start the quiz.'
	String get fillInAll => 'Fill in all the parameters to start\nthe quiz.';

	/// en: 'Start Quiz'
	String get startQuiz => 'Start Quiz';

	/// en: 'Are you sure about the selected parameters?'
	String get areYouSureAbout => 'Are you sure about the selected parameters?';

	/// en: 'Confirm'
	String get confirm => 'Confirm';

	/// en: 'Any Category'
	String get anyCategory => 'Any Category';

	/// en: 'Any Difficulty'
	String get anyDifficulty => 'Any Difficulty';

	/// en: 'Any Type'
	String get anyType => 'Any Type';

	/// en: 'Easy'
	String get easy => 'Easy';

	/// en: 'Medium'
	String get medium => 'Medium';

	/// en: 'Hard'
	String get hard => 'Hard';

	/// en: 'Multiple Choice'
	String get multipleChoice => 'Multiple Choice';

	/// en: 'True / False'
	String get trueFalse => 'True / False';

	/// en: 'Timer'
	String get timer => 'Timer';

	/// en: 'Correct!'
	String get correct => 'Correct!';

	/// en: 'Next'
	String get next => 'Next';

	/// en: 'Nope.'
	String get nope => 'Nope.';

	/// en: 'Finished'
	String get finished => 'Finished';

	/// en: 'Your result: ${correct} correct answers and ${incorrect} incorrect answers.'
	String yourResult({required Object correct, required Object incorrect}) => 'Your result: ${correct} correct answers and ${incorrect} incorrect answers.';

	/// en: 'Main'
	String get main => 'Main';

	/// en: 'Exit Quiz'
	String get exitQuiz => 'Exit Quiz';

	/// en: 'Are you sure you want to exit the quiz? All progress will be lost after exiting.'
	String get areYouSureYouWantToExit => 'Are you sure you want to exit\nthe quiz? All progress will be lost after exiting.';

	/// en: 'Exit'
	String get exit => 'Exit';

	/// en: 'Restart Quiz'
	String get restartQuiz => 'Restart Quiz';

	/// en: 'Are you sure you want to restart this quiz? After restarting, your current progress will be saved, but the questions may be different.'
	String get areYouSureYouWantToRestart => 'Are you sure you want to restart this quiz? After restarting, your current progress will be saved, but the questions may be different.';

	/// en: 'Restart'
	String get restart => 'Restart';

	/// en: 'You have achieved a new milestone!'
	String get youHaveAchievedNewMilestone => 'You have achieved a new milestone!';

	/// en: 'Okay'
	String get okay => 'Okay';

	/// en: '🛠 Creating quizzes'
	String get creatingQuizzes => '🛠 Creating quizzes';

	/// en: '🎯 Completing quizzes'
	String get completingQuizzes => '🎯 Completing quizzes';

	/// en: '🔓 Difficulty'
	String get difficulty => '🔓 Difficulty';

	/// en: '📊 Statistics / Records'
	String get statisticsRecords => '📊 Statistics / Records';

	/// en: '🧠 Intellectual tags'
	String get intellectualTags => '🧠 Intellectual tags';

	/// en: 'No internet connection'
	String get noInternetConnection => 'No internet connection';

	/// en: 'Retry'
	String get retry => 'Retry';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'appName' => 'QuizBattle',
			'loading' => 'Loading...',
			'quizBattle' => 'QuizBattle:',
			'betOnKnowledge' => 'Bet on knowledge',
			'createYourOwnGames' => 'Create your own games, choose themes, difficulty levels, and number of questions. Play and bet on your knowledge.\nTrack your stats, unlock achievements, and climb to the top of the experts!',
			'letsGo' => 'Let’s Go!',
			'welcomeBackGenius' => 'Welcome back, Genius',
			'your' => 'Your',
			'victoryIsRight' => 'victory is right',
			'hereJustProveItTo' => 'here! Just prove it to',
			'yourself' => 'yourself',
			'winRate' => 'Win Rate',
			'lossRate' => 'Loss Rate',
			'totalDone' => 'Total Done',
			'achievements' => 'Achievements',
			'startGame' => 'Start Game',
			'settings' => 'Settings',
			'buzzSettings' => 'Buzz Settings',
			'sendToFriends' => 'Send to Friends',
			'tellUsWhatYouThink' => 'Tell Us What You Think',
			'showSomeLove' => 'Show Some Love',
			'playerPrivacy' => 'Player Privacy',
			'resetMyJourney' => 'Reset My Journey',
			'areYouSureYouWantToReset' => 'Are you sure you want to reset your statistics and achievements?\nAfter resetting, all progress will be lost.',
			'cancel' => 'Cancel',
			'reset' => 'Reset',
			'versionApp' => ({required Object icon, required Object version}) => '${icon} Version App: ${version}',
			'numberOfQuestions' => 'Number of Questions',
			'selectCategory' => 'Select Category',
			'selectDifficulty' => 'Select Difficulty',
			'selectType' => 'Select Type',
			'quizOption' => 'Quiz Option',
			'fillInAll' => 'Fill in all the parameters to start\nthe quiz.',
			'startQuiz' => 'Start Quiz',
			'areYouSureAbout' => 'Are you sure about the selected parameters?',
			'confirm' => 'Confirm',
			'anyCategory' => 'Any Category',
			'anyDifficulty' => 'Any Difficulty',
			'anyType' => 'Any Type',
			'easy' => 'Easy',
			'medium' => 'Medium',
			'hard' => 'Hard',
			'multipleChoice' => 'Multiple Choice',
			'trueFalse' => 'True / False',
			'timer' => 'Timer',
			'correct' => 'Correct!',
			'next' => 'Next',
			'nope' => 'Nope.',
			'finished' => 'Finished',
			'yourResult' => ({required Object correct, required Object incorrect}) => 'Your result: ${correct} correct answers and ${incorrect} incorrect answers.',
			'main' => 'Main',
			'exitQuiz' => 'Exit Quiz',
			'areYouSureYouWantToExit' => 'Are you sure you want to exit\nthe quiz? All progress will be lost after exiting.',
			'exit' => 'Exit',
			'restartQuiz' => 'Restart Quiz',
			'areYouSureYouWantToRestart' => 'Are you sure you want to restart this quiz? After restarting, your current progress will be saved, but the questions may be different.',
			'restart' => 'Restart',
			'youHaveAchievedNewMilestone' => 'You have achieved a new milestone!',
			'okay' => 'Okay',
			'creatingQuizzes' => '🛠 Creating quizzes',
			'completingQuizzes' => '🎯 Completing quizzes',
			'difficulty' => '🔓 Difficulty',
			'statisticsRecords' => '📊 Statistics / Records',
			'intellectualTags' => '🧠 Intellectual tags',
			'noInternetConnection' => 'No internet connection',
			'retry' => 'Retry',
			_ => null,
		};
	}
}
