const report = require('multiple-cucumber-html-reporter');

report.generate({
    jsonDir: './features/reports/json/',
    reportPath: './features/reports/html-reporter/Ciclo II',
    openReportInBrowser: 'true',
    saveCollectedJSON: 'true',
    pageTitle: 'Reporte de Ejecución de Pruebas Automáticas',
    reportName: 'Reporte de Ejecución de Pruebas Automáticas',
    pageFooter: 'Ejecutado por: Marisleydi Hondar Martinez',
    displayDuration: 'true',
    durationInMS: 'true',
    metadata: {
        browser: {
            name: 'Firefox',
            version: 'Versión 75.0.3770.142 (Build oficial) (64 bits)'
        },
        device: 'Local test machine',
        platform: {
            name: 'Windows',
            version: '10'
        }
    },
    customData: {
        title: 'Datos de Ejecución',
        data: [
            { label: 'Sistema', value: 'Simple' },
            { label: 'Sprint', value: '16' },
            { label: 'Ciclo', value: 'II' },
            { label: 'Execution Start Time', value: '08/08/2019, 16:36' },
            { label: 'Execution End Time', value: '08/08/2019, 15:51' }
        ]
    }
});


// var reporter = require('cucumber-html-reporter');

// var options = {
//     theme: 'bootstrap',
//     name: 'Reporte de Ejecución Automática de Simple',
//     // jsonDir: 'features/reports/json',
//     jsonFile: 'features/reports/json/report_firefox_2019-08-08_15.49.00.json',
//     output: 'features/reports/html-reporter/report.html',
//     reportSuiteAsScenarios: true,
//     brandTitle: 'Simple Test',
//     storeScreenshots: 'false',
//     // screenshotsDirectory: 'features/screenshots/fin_script',
//     columnLayout: 2,
//     launchReport: true,
//     ignoreBadJsonFile: true,
//     metadata: {
//         "App Version": "0.0.1",
//         "Test Environment": "staging",
//         "Browser": "Firefox Quantum 68.0.1",
//         "Platform": "Windows 10",
//         "Parallel": "Scenarios",
//         "Executed": "Local"
//     }
// };

// reporter.generate(options);

// var reporter = require('cucumber-html-reporter');

// var options = {
//     theme: 'bootstrap',
//     name: 'Reporte de Ejecución Automática',
//     jsonDir: 'features/reports/json',
//     output: 'test/report/cucumber_report.html',
//     reportSuiteAsScenarios: true,
//     launchReport: true,
//     metadata: {
//         "App Version": "0.0.1",
//         "Test Environment": "staging",
//         "Browser": "Chrome  54.0.2840.98",
//         "Platform": "Windows 10",
//         "Parallel": "Scenarios",
//         "Executed": "Local"
//     }
// };

// reporter.generate(options);