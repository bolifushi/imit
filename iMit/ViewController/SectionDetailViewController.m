//■ ■ ■
//■ DetailViewController.m
//■ ビューコントローラ - 詳細シーン
//■ ■
#import "Section.h"
#import "SectionDetailViewController.h"

@interface SectionDetailViewController ()
- (void)configureView;
@end

@implementation SectionDetailViewController

#pragma mark - Managing the detail item

//カスタムsetterメソッド
- (void)setSection:(Section *)newSection
{
    if (_section != newSection) {
        _section = newSection;
        
        // ビューを更新する
        [self configureView];
    }
}

- (void)configureView
{
    Section *theSection = self.section;
    
    static NSDateFormatter *formatter = nil;
    if (formatter == nil) {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterMediumStyle];
    }
    if (theSection) {
        self.sectionNameLabel.text = theSection.name;
        self.codeLabel.text = theSection.code;
        self.dateLabel.text = [formatter stringFromDate:(NSDate *)theSection.date];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configureView];
}

- (void)viewDidUnload
{
    [self setCodeLabel:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
