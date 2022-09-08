import 'package:flutter/material.dart';

import '../model/category.dart';
import '../model/resource.dart';
import '../presentation/resource_detail_page.dart';
import '../presentation/resource_list_cat_page.dart';
import '../presentation/unit_list_page.dart';
import '../repository/resource_repository.dart';
import '../repository/sqlite/sqlite_resource_repository.dart';

class ResilienceSearchDelegate extends SearchDelegate {
  late List<String> searchSuggestions;
  List<String> searchTerms = [
    "AFRC Units",
    "Air Force Aid Society",
    "Air Force Wounded Warrior (AFW2) Program",
    "Airman & Family Readiness (A&FR)",
    "Alcoholics Anonymous",
    "American Legion",
    "American Red Cross",
    "Area Defense Counsel (ADC)",
    "Blue Star Families",
    "Career OneStop",
    "Carson's Village",
    "CDC National HIV and AIDS Hotline",
    "Chaplain/Religious Affairs",
    "Childcare",
    "Civilian Health Promotion Services (CHPS)",
    "Consumer Financial Protection Bureau",
    "Counseling Services",
    "Crisis Text Line",
    "Defense Equal Opportunity Management Institute (DEOMI)",
    "Department of Labor",
    "Deployment Transition Center (DTC)",
    "Force Development",
    "Director of Psychological Health (DPH)",
    "DirectSTEP",
    "Disabled American Veterans",
    "Diversity & Inclusion (D&I)",
    "Discrimination/Harassment",
    "DoD Safe Helpline",
    "DoD SkillBridge Program",
    "Drug Demand Reduction (DDR)",
    "Employee Assistance Program (EAP)",
    "Employment",
    "Employer Support of the Guard and Reserve (ESGR)",
    "Exceptional Family Member Program (EFMP)",
    "Family Deployment Support",
    "Family Advocacy Program",
    "FEMA",
    "Finance",
    "FINRA Foundation",
    "First Sergeant",
    "Fitness and Health Promotion Manager (FHPM)",
    "Gamblers Anonymous",
    "Health and Welfare",
    "Hearts Apart",
    "Hiring Our Heroes",
    "Human Performance Resources by Champ (HPRC)",
    "Information Referral",
    "Inspector General (IG)",
    "inTransition",
    "Key Spouse Program",
    "Legal",
    "LGBT National Hotline",
    "Life Events",
    "Local Community",
    "Medical",
    "Master Resilience Trainer",
    "Military and Family Life Counseling (MFLC)",
    "Military Child Care",
    "Military Child Education Coalition (MCEC)",
    "Military OneSource",
    "Military Pay Office",
    "Military Spouse Programs - USO",
    "Mindfulness Coach - VA",
    "Morale, Welfare, and Recreation (MWR) Programs",
    "Narcotics Anonymous",
    "National Alliance on Mental Illness (NAMI)",
    "National Domestic Violence Hotline",
    "National Eating Disorders Association (NEDA) Hotline",
    "National Grad Crisis Line",
    "National Human Trafficking Hotline",
    "National Maternal Mental Health Hotline",
    "National Resource Directory",
    "National Runaway Safeline",
    "National Sexual Assault Hotline",
    "National Suicide Prevention Lifeline",
    "No Barriers Organization",
    "Office of Special Investigations (OSI)",
    "Operation Homefront",
    "Patriot Guard Riders",
    "PenFed Foundation",
    "Professional Financial Counselor (PFC)",
    "Psychological Health Advocacy Program (PHAP)",
    "PTSD Coach - VA",
    "Recharge for Resiliency (R4R) Programs",
    "Recovery Care Coordinator",
    "Reserve Organization of America",
    "Resilience Training Assistant",
    "Relationships",
    "Resiliency Support",
    "Safetalk Suicide Prevention Course",
    "Salvation Army",
    "SARC/Victim Advocate",
    "School/Education",
    "Sexual Assault",
    "Sleep Hygiene",
    "special investigations",
    "Spiritual Support",
    "Spouse Resiliency Toolkit",
    "Substance Abuse and Mental Health Services Administration National Hotline",
    "Suicide Prevention",
    "The Trevor Project",
    "Tricare",
    "UNITE",
    "Transition Employment Assistance For Military Spouses and Caregivers (TEAMS)",
    "USA Jobs/NAF Jobs",
    "US DHHS Office of Community Assistance",
    "United Way 2-1-1",
    "Vet Center",
    "Veterans Affairs (VA)",
    "Veterans Benefits Administration (VBA)",
    "Veterans Crisis Line",
    "Virtual Hope - VA",
    "VFW Unmet Needs",
    "Violence/Abuse",
    "Violence Prevention Integrator (VPI)",
    "Wing Career Assistance Advisor (WCAA)",
    "Yellow Ribbon Program",
  ];

  @override
  String get searchFieldLabel => 'Search for...';

  // @override
  // ThemeData appBarTheme(BuildContext context) {
  //   return Theme.of(context).copyWith(
  //     primaryColor:
  //         MaterialHelper.getMaterialColorForColor(Colors.blue.shade800),
  //     accentColor: Colors.white,
  //   );
  // }

  // Clear search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  // Pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  // Show query result
  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    _getSearchSuggestions().then((result) {
      searchSuggestions = result;
    });

    for (var fruit in searchSuggestions) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  // Show querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
          onTap: () {
            _processSearchRequest(context, result);
          },
        );
      },
    );
  }

  _processSearchRequest(BuildContext context, String result) async {
    final navigator = Navigator.of(context);

    Category? category = await _getCategoryByName(result);

    // Check if category
    if (category != null) {
      navigator.push(MaterialPageRoute(builder: (context) {
        return ResourceListCatPage(
          category: category,
        );
      }));
    }

    // Check if resource
    Resource? resource = await _getResourceByName(result);
    if (resource != null) {
      navigator.push(MaterialPageRoute(builder: (context) {
        return ResourceDetailPage(
          resource: resource,
        );
      }));
    }

    // Check if AFRC
    if (result == "AFRC Units") {
      navigator.push(MaterialPageRoute(builder: (context) {
        return const UnitListPage();
      }));
    }

    // Search DB for descriptions
  }

  Future<Category?> _getCategoryByName(String name) async {
    ResourceRepository repository = SqliteResourceRepository();

    return await repository.getCategoryByName(name);
  }

  Future<Resource?> _getResourceByName(String name) async {
    ResourceRepository repository = SqliteResourceRepository();

    return await repository.getResourceByName(name);
  }

  Future<List<String>> _getSearchSuggestions() async {
    ResourceRepository repository = SqliteResourceRepository();

    return await repository.getResourceAndCategoryNames();
  }
}
