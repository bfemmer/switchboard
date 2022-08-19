import 'package:flutter/material.dart';

import '../model/category.dart';
import '../model/resource.dart';
import '../presentation/resource_detail_page.dart';
import '../presentation/resource_list_cat_page.dart';
import '../presentation/unit_list_page.dart';
import '../repository/resource_repository.dart';
import '../repository/sqlite/sqlite_resource_repository.dart';

class ResilienceSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    "abuse",
    "afas",
    "AFRC Units",
    "aids",
    "Air Force Aid Society (AFAS)",
    "Air Force Wounded Warrior (AFW2) Program",
    "Airmen and Family Readiness (A&FR)",
    "American Legion",
    "American Red Cross",
    "Area Defense Counsel (ADC)",
    "assault",
    "Blue Star Families",
    "Career OneStop",
    "Carson's Village",
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
    "Family Deployment Support",
    "Family Advocacy Program",
    "FEMA",
    "Finance",
    "FINRA Foundation",
    "First Sergeant",
    "Fitness and Health Promotion Manager (FHPM)",
    "Exceptional Family Member Program (EFMP)",
    "Health and Welfare",
    "Hearts Apart",
    "Hiring Our Heroes",
    "hiv",
    "hope",
    "hprc",
    "Information Referral",
    "Inspector General (IG)",
    "inTransition",
    "Key Spouse Program",
    "Legal",
    "Local Community",
    "lgbt",
    "Life Events",
    "Medical",
    "mental health",
    "Master Resilience Trainer",
    "Military and Family Life Counseling (MFLC)",
    "Military Child Care",
    "Military Child Education Coalition (MCEC)",
    "Military OneSource",
    "Military Spouse Programs - USO",
    "Mindfulness Coach - VA",
    "Morale, Welfare, and Recreation (MWR) Programs",
    "National Domestic Violence Hotline",
    "National Grad Crisis Line",
    "National Maternal Mental Health Hotline",
    "National Resource Directory",
    "National Sexual Assault Hotline",
    "National Suicide Prevention Lifeline",
    "No Barriers Organization",
    "Office of Special Investigations (OSI)",
    "Operation Homefront",
    "pay",
    "Patriot Guard Riders",
    "PenFed Foundation",
    "Professional Financial Counselor (PFC)",
    "Psychological Health Advocacy Program (PHAP)",
    "PTSD Coach - VA",
    "Recharge for Resiliency (R4R) Programs",
    "Recovery Care Coordinator",
    "Reserve Organization of America",
    "Resilience Training Assistant",
    "recreation",
    "Relationships",
    "Resiliency Support",
    "Safetalk Suicide Prevention Course",
    "Salvation Army",
    "SARC/Victim Advocate",
    "School/Education",
    "Sexual Assault",
    "shirt",
    "sleep hygiene",
    "special investigations",
    "Spiritual Support",
    "Spouse Resiliency Toolkit",
    "Suicide Prevention",
    "trafficking",
    "trevor",
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

  // first overwrite to clear the search text
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

  // second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  // third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
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
        );
      },
    );
  }

  // last overwrite to show the querying process at the runtime
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
    Category? category = await _getCategoryByName(result);

    // Check if category
    if (category != null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ResourceListCatPage(
          category: category,
        );
      }));
    }

    // Check if resource
    Resource? resource = await _getResourceByName(result);
    if (resource != null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ResourceDetailPage(
          resource: resource,
        );
      }));
    }

    // Check if AFRC
    if (result == "AFRC Units") {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
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
}
